"""Frozen open-generation pilot. ChatGPT authenticated CLI, no paid external API.
Keep every request and response. No retries, no prompt tuning after discovery.
"""
import csv, hashlib, json, subprocess, sys, time
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor, as_completed

ROOT=Path(__file__).resolve().parents[1]
CLI='/opt/homebrew/bin/codex'
MODEL='gpt-5.6-sol'
EMPTY=Path('/private/tmp/ppc-carbon-cli-empty')
EMPTY.mkdir(exist_ok=True)
TEXT={'type':'string'}
def obj(p): return dict(type='object',properties=p,required=list(p),additionalProperties=False)
WORLD=obj(dict(id=TEXT,memo=TEXT,public_note=TEXT,candidate_implication=TEXT,derivation=TEXT,extra_assumption=TEXT))
GEN_SCHEMA=obj(dict(model_id=TEXT,worlds=dict(type='array',items=WORLD)))

COMMON='''Fictional methodological experiment about carbon pricing, not reconstruction of history. Do not use tools, files, web, code execution, external random number generators or prior conversations. Report your exact model ID if known; otherwise write UNKNOWN. Output JSON only.
A world consists of one coalition of four energy firms and one federal carbon-pricing proposal. Treat the coalition as one actor. The coalition endorsed the proposal on day 0. The proposal cost is 6. Initially the expected burden of alternative carbon regulation and the incremental competitive benefit are each 12. The competitive benefit is measured BEFORE the common proposal cost 6, which is subtracted once.
On day 10 a reliable private notice changes exactly one of the two benefits from 12 to 2, leaving the other at 12. The two kinds of notice each have probability .5. No actor knows which notice will arrive before day 10; the public never receives the notice directly.
Under hypothesis SA, the payoff from continued support equals the expected burden of alternative regulation minus the proposal cost. Under hypothesis CA, it equals the incremental competitive benefit minus the proposal cost. After the notice the coalition chooses support if its payoff is nonnegative, and otherwise chooses not to support, with an independent probability .05 of reversing that decision.
An internal memo on day 11 faithfully records the coalition's actual decision. A public note on day 12 communicates that actual decision faithfully with probability .95, independently of the other draws, and otherwise says the opposite. Private commercial numbers are not publicly disclosed. Draw new notices and errors independently for each world according to these probabilities. Do not balance the sample, enforce quotas or choose examples to show every possible state.
Generate the world by working through these causal rules yourself. Write its synthetic internal memo (maximum 90 words) and public note (maximum 55 words), letting consequences appear in the documents without receiving an outcome vector or checklist. The memo can contain internal reasoning. Label every document SYNTHETIC. Do not add historical names or quotations.
Separately, propose one additional testable implication suggested by the mechanism and your generated world, beyond restating a single premise. This must be a prediction about documentary evidence a researcher could look for, not a claim about actual history. Explain which premises jointly imply it and state any extra assumption (NONE if none). The generated documents can instantiate consequences, but your candidate prediction must remain distinct from those occurred synthetic facts.
'''

def call(name,prompt,schema):
    raw=ROOT/'raw'/name;raw.mkdir(exist_ok=True)
    if (raw/'status.json').exists(): return dict(name=name,skipped_existing=True)
    (ROOT/'prompts'/f'{name}.txt').write_text(prompt)
    (raw/'schema.json').write_text(json.dumps(schema,indent=2))
    command=[CLI,'exec','--ignore-user-config','--skip-git-repo-check','--ephemeral','-s','read-only','-C',str(EMPTY),'-m',MODEL,'-c','model_reasoning_effort="low"','--json','--output-schema',str(raw/'schema.json'),'-o',str(raw/'answer.json'),'-']
    status=dict(name=name,model_alias_requested=MODEL,reasoning_effort='low',command=command,started_utc=time.strftime('%Y-%m-%dT%H:%M:%SZ',time.gmtime()),prompt_sha256=hashlib.sha256(prompt.encode()).hexdigest())
    start=time.time()
    try:
        with open(raw/'events.jsonl','w') as out,open(raw/'stderr.txt','w') as err:
            p=subprocess.run(command,input=prompt,text=True,stdout=out,stderr=err,timeout=300)
        status['returncode']=p.returncode;status['answer_exists']=(raw/'answer.json').exists()
    except Exception as exc:status['error']=str(exc)
    status['elapsed_seconds']=round(time.time()-start,3)
    events=[]
    for line in (raw/'events.jsonl').read_text().splitlines():
        try:events.append(json.loads(line))
        except ValueError:pass
    status['tool_events']=[e for e in events if e.get('item',{}).get('type') in ['command_execution','mcp_tool_call','web_search','file_change']]
    status['usage']=[e.get('usage') for e in events if e.get('type')=='turn.completed']
    if (raw/'answer.json').exists():
        try:status['model_id_self_reported']=json.loads((raw/'answer.json').read_text()).get('model_id')
        except ValueError:pass
    (raw/'status.json').write_text(json.dumps(status,indent=2))
    return {k:v for k,v in status.items() if k not in ['command','tool_events']}

def dispatch(tasks):
    with ThreadPoolExecutor(max_workers=2) as pool:
        futures=[pool.submit(call,*t) for t in tasks]
        for f in as_completed(futures):print(json.dumps(f.result()),flush=True)

def generate(stage):
    nb,nw=(2,4) if stage=='discovery' else (8,8)
    tasks=[]
    for h in ['SA','CA']:
        for b in range(1,nb+1):
            ids=[f'{stage}_{h}_{b:02d}_{i:02d}' for i in range(1,nw+1)]
            prompt=COMMON+f'\nFor this request use hypothesis {h}. Produce {nw} new worlds with IDs: '+json.dumps(ids)
            tasks.append((f'{stage}_{h}_{b:02d}',prompt,GEN_SCHEMA))
    dispatch(tasks)

def select():
    corpus=[]
    for path in sorted((ROOT/'raw').glob('discovery_*/answer.json')):
        corpus.extend(json.loads(path.read_text())['worlds'])
    (ROOT/'data/discovery_corpus.json').write_text(json.dumps(corpus,indent=2))
    check=obj(dict(id=TEXT,name=TEXT,first_candidate_id=TEXT,prediction=TEXT,indicator_definition=TEXT,required_document_fields=TEXT,novel_combination=TEXT,extra_assumption=TEXT))
    schema=obj(dict(model_id=TEXT,checks=dict(type='array',items=check),candidate_audit=dict(type='array',items=obj(dict(world_id=TEXT,admissible=dict(type='boolean'),reason=TEXT)))))
    prompt='''You are a selector with no access to test outcomes or hidden evaluation conditions. Do not use tools. Report exact model ID or UNKNOWN. Select AT MOST THREE nonredundant additional observable implications from the candidate corpus below, in order of first occurrence in the provided corpus. Each must combine at least two premises and be measurable from internal/public documents. Do not select restatements of timing, privacy, the marginal probability of fidelity, or the payoff rule. An implication may be a derived relation between shock type and later evidence, but do not invent consequences not proposed in the corpus. Reject implications requiring an extra premise that lacks a model, except purely measurement availability already satisfied by these documents. Do not use unknown hypothesis labels as observed data. Give each selected implication a precise indicator computable using ONLY documentary facts, independently of hidden H. It can be a categorical indicator or a joint relation, not necessarily one bit. Audit all candidates with reasons including duplicates. Return zero checks if no candidate qualifies. Output JSON only.\nGENERATION FOUNDATIONS:\n'''+COMMON+'\nCANDIDATES AND DOCUMENTS (ordered lexicographically by request ID, then world order):\n'+json.dumps(corpus)
    print(json.dumps(call('select_checks',prompt,schema)),flush=True)

if __name__=='__main__':
    action=sys.argv[1]
    if action in ['discovery','confirmation']:generate(action)
    elif action=='select':select()
