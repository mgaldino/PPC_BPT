"""Run the frozen pilot through ChatGPT-authenticated Codex CLI (no API key).
No automatic retries. Every request, raw response, CLI event and failure is saved.
Usage: python run_pilot.py generate | prepare_coding | code | collect
"""
import csv, hashlib, json, os, random, subprocess, sys, time
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CLI = '/opt/homebrew/bin/codex'
EMPTY = Path('/private/tmp/ppc-carbon-cli-empty')
EMPTY.mkdir(exist_ok=True)
MODEL = 'gpt-6-sol'

def readcsv(path):
    with open(path, encoding='utf-8') as f: return list(csv.DictReader(f))

def writecsv(path, rows, fields):
    with open(path, 'w', encoding='utf-8', newline='') as f:
        w=csv.DictWriter(f, fieldnames=fields); w.writeheader(); w.writerows(rows)

def object_schema(properties):
    return {'type':'object','properties':properties,'required':list(properties),'additionalProperties':False}

BIT={'type':'integer','enum':[0,1]}
TEXT={'type':'string'}
WORLD=object_schema(dict(id=TEXT,Q=BIT,K=BIT,A=BIT,memo=TEXT,public_note=TEXT,
                        candidate_implication=TEXT,extra_assumption=TEXT))
GEN_SCHEMA=object_schema({'worlds':{'type':'array','items':WORLD}})
CODE_WORLD=object_schema(dict(id=TEXT,Q_c={'type':'integer','enum':[-1,0,1]},
    K_c={'type':'integer','enum':[-1,0,1]},A_c={'type':'integer','enum':[-1,0,1]},
    contradiction={'type':'boolean'},explanation=TEXT))
CODE_SCHEMA=object_schema({'worlds':{'type':'array','items':CODE_WORLD}})

COMMON='''This is a fictional methodological experiment, not a reconstruction of real history.
Do not use any tools, files, web, code execution, external RNG or prior conversation.
One world contains a four-firm energy coalition facing one federal carbon-pricing proposal.
Q=1: the proposal offers replacement of overlapping command-and-control carbon rules; Q=0: it offers no such replacement.
K=1: the coalition's internal assessment anticipates a net competitive gain; K=0: it anticipates no net competitive gain. Direct costs alone do not determine K.
A=1: the four-firm coalition collectively joins the proposal; A=0: it does not collectively join. Do not invent individual-firm decisions.
Produce a fictional internal memo (<=45 words) explicitly revealing Q,K,A, and a public note (<=45 words) explicitly revealing Q,A but not disclosing the internal K assessment. Both must describe the same world, without new historical actors, numbers or additional events. Label both SYNTHETIC. Natural prose, no Q/K/A variable names in the documents.
Separately propose ONE additional observable implication worth researching in this world, beyond restating Q,K,A. State the extra behavioral/documentary assumption required. This is a candidate prediction, NOT an occurred fact. It must not enter the documents.
Output only the requested JSON. Preserve IDs. Do not balance samples, force quotas or choose examples to illustrate all cells.
'''

def call(name, prompt, schema):
    raw=ROOT/'raw'/name; raw.mkdir(exist_ok=True)
    answer=raw/'answer.json'
    if (raw/'status.json').exists():
        return {'name':name,'skipped_existing':True}
    (ROOT/'prompts'/f'{name}.txt').write_text(prompt,encoding='utf-8')
    (raw/'schema.json').write_text(json.dumps(schema,ensure_ascii=False,indent=2))
    command=[CLI,'exec','--ignore-user-config','--skip-git-repo-check','--ephemeral',
       '-s','read-only','-C',str(EMPTY),'-m',MODEL,'-c','model_reasoning_effort="low"',
       '--json','--output-schema',str(raw/'schema.json'),'-o',str(answer),'-']
    start=time.time()
    status={'name':name,'model_alias_requested':MODEL,'reasoning_effort':'low',
       'command':command,'started_utc':time.strftime('%Y-%m-%dT%H:%M:%SZ',time.gmtime()),
       'prompt_sha256':hashlib.sha256(prompt.encode()).hexdigest()}
    try:
        with open(raw/'events.jsonl','w') as out, open(raw/'stderr.txt','w') as err:
            p=subprocess.run(command,input=prompt,text=True,stdout=out,stderr=err,timeout=240)
        status['returncode']=p.returncode
        status['answer_exists']=answer.exists()
    except Exception as exc: status['error']=str(exc)
    status['elapsed_seconds']=round(time.time()-start,3)
    events=[]
    for line in (raw/'events.jsonl').read_text().splitlines():
        try: events.append(json.loads(line))
        except ValueError: pass
    status['tool_events']=[e for e in events if e.get('item',{}).get('type') in
       ['command_execution','mcp_tool_call','web_search','file_change']]
    status['usage']=[e.get('usage') for e in events if e.get('type')=='turn.completed']
    (raw/'status.json').write_text(json.dumps(status,indent=2,ensure_ascii=False))
    return {k:v for k,v in status.items() if k not in ['command','tool_events']}

def dispatch(tasks):
    with ThreadPoolExecutor(max_workers=2) as pool:
        futures=[pool.submit(call,*t) for t in tasks]
        for f in as_completed(futures): print(json.dumps(f.result()),flush=True)

def templates(row):
    q,k,a=[int(row[v]) for v in ['Q','K','A']]
    qtext='offers replacement of overlapping carbon regulations' if q else 'offers no replacement of overlapping carbon regulations'
    ktext='anticipates a net competitive gain' if k else 'anticipates no net competitive gain'
    atext='collectively joins' if a else 'does not collectively join'
    return dict(memo=f'SYNTHETIC. Internal memo: The proposal {qtext}. Our internal assessment {ktext}. The four-firm coalition {atext} the proposal.',
        public_note=f'SYNTHETIC. Public note: The proposal {qtext}. The four-firm coalition {atext} the proposal.',
        candidate_implication='',extra_assumption='')

def generate():
    states=readcsv(ROOT/'data/bc_states.csv')
    tasks=[]; mapping=[]
    for h in ['SA','CA']:
        for b in range(1,5):
            ids=[f'A_{h}_{i:02d}' for i in range((b-1)*8+1,b*8+1)]
            formula='0.1 + 0.6*Q + 0.1*K' if h=='SA' else '0.1 + 0.1*Q + 0.6*K'
            name=f'gen_A_{h}_{b}'
            prompt=COMMON+f'\nSampling task: hypothesis {h}. Draw Q and K independently as Bernoulli(0.5), then draw A as Bernoulli({formula}). Generate eight independent worlds using these probabilities, not quotas. IDs: '+json.dumps(ids)
            tasks.append((name,prompt,GEN_SCHEMA))
            for id_ in ids: mapping.append(dict(id=id_,raw_id=id_,arm='A',H=h,batch=b,request=name))
    for j,(h,b) in enumerate([(h,b) for h in ['SA','CA'] for b in range(1,5)]):
        chunk=[r for r in states if r['H']==h and int(r['batch'])==b]
        payload=[];name=f'gen_B_{h}_{b}'
        for i,r in enumerate(chunk):
            opaque=f'W{j*8+i+1:03d}'
            payload.append(dict(id=opaque,**{v:int(r[v]) for v in ['Q','K','A']}))
            mapping.append(dict(id=r['id'],raw_id=opaque,arm='B',H=h,batch=b,request=name))
        tasks.append((name,COMMON+'\nRendering task: states were already randomly sampled. DO NOT resample, modify or balance them. Repeat the supplied states exactly in JSON and write their documents:\n'+json.dumps(payload),GEN_SCHEMA))
    tasks.append(('gen_control',COMMON+'\nDeterministic sampling control. P(Q=1)=1,P(K=1)=0,P(A=1)=1. Generate four worlds IDs CTRL01,CTRL02,CTRL03,CTRL04.',GEN_SCHEMA))
    writecsv(ROOT/'data/request_map.csv',mapping,['id','raw_id','arm','H','batch','request'])
    dispatch(tasks)

def prepare_coding():
    mapping=readcsv(ROOT/'data/request_map.csv'); states=readcsv(ROOT/'data/bc_states.csv')
    bc={r['id']:r for r in states};docs=[];worlds=[];failures=[];controls=[]
    for m in mapping:
        path=ROOT/'raw'/m['request']/'answer.json'
        try:
            answer=json.loads(path.read_text()); matches=[r for r in answer['worlds'] if r['id']==m['raw_id']]
            if len(matches)!=1: raise ValueError(f'ID count {len(matches)}')
            r=matches[0]
            state={v:int(r[v]) for v in ['Q','K','A']} if m['arm']=='A' else {v:int(bc[m['id']][v]) for v in ['Q','K','A']}
            worlds.append({k:m[k] for k in ['id','arm','H','batch']}|state)
            docs.append(dict(id=m['id'],memo=r['memo'],public_note=r['public_note'],
                candidate_implication=r['candidate_implication'],extra_assumption=r['extra_assumption'],
                returned_state={v:r[v] for v in ['Q','K','A']}))
        except Exception as exc: failures.append(dict(id=m['id'],error=str(exc)))
    for r in states:
        id_=r['id'].replace('B_','C_',1)
        worlds.append(dict(id=id_,arm='C',H=r['H'],batch=r['batch'],**{v:int(r[v]) for v in ['Q','K','A']}))
        docs.append(dict(id=id_,**templates(r),returned_state={v:int(r[v]) for v in ['Q','K','A']}))
    # These controlled texts are excluded from the main worlds table.
    controls=[
      dict(id='AUDIT_CONTRA_A',memo='SYNTHETIC. The proposal offers regulatory replacement. No net competitive gain is expected. The four-firm coalition collectively joins.',public_note='SYNTHETIC. The proposal offers regulatory replacement. The four-firm coalition does not collectively join.'),
      dict(id='AUDIT_CONTRA_Q',memo='SYNTHETIC. The proposal offers no replacement of carbon rules. Net competitive gain is expected. The coalition joins.',public_note='SYNTHETIC. The proposal replaces carbon rules. The coalition joins.'),
      dict(id='AUDIT_UNKNOWN_K',memo='SYNTHETIC. The proposal offers replacement of carbon rules. The coalition joins. No competitive assessment is available.',public_note='SYNTHETIC. The proposal offers replacement of carbon rules. The coalition joins.')]
    (ROOT/'data/documents.json').write_text(json.dumps(docs,ensure_ascii=False,indent=2))
    (ROOT/'data/failures.json').write_text(json.dumps(failures,indent=2))
    writecsv(ROOT/'data/worlds.csv',worlds,['id','arm','H','batch','Q','K','A'])
    blind=docs+controls;random.Random(20261012).shuffle(blind)
    code_map=[];payload=[]
    for i,d in enumerate(blind):
        opaque=f'D{i+1:03d}'
        code_map.append(dict(opaque=opaque,id=d['id'],request=f'code_{i//16+1:02d}'))
        payload.append(dict(id=opaque,memo=d['memo'],public_note=d['public_note']))
    writecsv(ROOT/'data/code_map.csv',code_map,['opaque','id','request'])
    (ROOT/'data/blinded_documents.json').write_text(json.dumps(payload,ensure_ascii=False,indent=2))
    print(json.dumps(dict(worlds=len(worlds),documents=len(docs),failures=failures)))

def code():
    payload=json.loads((ROOT/'data/blinded_documents.json').read_text())
    tasks=[]
    instructions='''Code these synthetic document pairs independently. No tools or external information. You do not know their generators or true states. Use only explicit document contents. Q_c=1 if proposal offers replacement of carbon regulations, 0 if explicitly not; K_c=1 if internal assessment anticipates NET competitive gain, 0 if explicitly no net gain; A_c=1 if coalition collectively joins, 0 if explicitly not. Use -1 when unknown, ambiguous, or contradictory. Do not infer K from regulatory benefit or support. contradiction=true when memo and public note conflict about a FACT; public omission of K is not contradiction. Give a short explanation for ambiguous/contradictory cases, otherwise empty string. Output JSON only.\n'''
    for i in range(0,len(payload),16): tasks.append((f'code_{i//16+1:02d}',instructions+json.dumps(payload[i:i+16]),CODE_SCHEMA))
    dispatch(tasks)

def collect():
    rows=[];failures=[]
    for m in readcsv(ROOT/'data/code_map.csv'):
        try:
            result=json.loads((ROOT/'raw'/m['request']/'answer.json').read_text())
            matches=[r for r in result['worlds'] if r['id']==m['opaque']]
            if len(matches)!=1: raise ValueError(f'ID count {len(matches)}')
            r=matches[0]; rows.append(dict(id=m['id'],**{v:r[v] for v in ['Q_c','K_c','A_c','contradiction','explanation']}))
        except Exception as exc: failures.append(dict(id=m['id'],error=str(exc)))
    writecsv(ROOT/'data/coded.csv',rows,['id','Q_c','K_c','A_c','contradiction','explanation'])
    (ROOT/'data/coding_failures.json').write_text(json.dumps(failures,indent=2))
    print(json.dumps(dict(coded=len(rows),failures=failures)))

def discover():
    schema=object_schema({'implications':{'type':'array','items':object_schema(dict(
        id=TEXT,prediction=TEXT,reasoning=TEXT,extra_assumption=TEXT,
        observable_document=TEXT,rival_prediction=TEXT,derivable_from_core={'type':'boolean'}))}})
    prompt='''Do not use tools, files, web or historical examples. This is a prospective method-design exercise about a fictional four-firm energy coalition and a federal carbon-pricing proposal. No observed case outcomes or source documents are supplied. Q means offered replacement of overlapping carbon regulations. K means anticipated NET competitive gain. A means coalition joins. Q,K are independent Bernoulli(.5). Under strategic-accommodation-like response SA, P(A=1)=.1+.6Q+.1K. Under competitive-advantage-like response CA, P(A=1)=.1+.1Q+.6K. Parameters are synthetic test values. Internal and public documents may be available.
Propose exactly FIVE additional testable implications that a researcher might miss by looking only at support for carbon pricing. Distinguish a deduction from these mathematical rules from an auxiliary hypothesis you introduce. For each, state directional prediction, reasoning, extra assumption if any, exact documentary observation to seek, and prediction under the rival. Do not invent historical facts, sources, probabilities or claim your suggestion is validated. Avoid simply restating Q,K,A for one world. Output JSON only.'''
    print(json.dumps(call('discovery',prompt,schema)),flush=True)

if __name__=='__main__':
    {'generate':generate,'prepare_coding':prepare_coding,'code':code,'collect':collect,'discover':discover}[sys.argv[1]]()
