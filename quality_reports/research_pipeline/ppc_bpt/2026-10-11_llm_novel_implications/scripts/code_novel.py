"""Blind coding and reversible template compilation, separate from generation."""
import csv,json,random,re,sys
from run_novel import ROOT,TEXT,obj,dispatch

def csvwrite(path,rows):
    with open(path,'w',newline='') as f:
        w=csv.DictWriter(f,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)
def csvread(path):
    with open(path) as f:return list(csv.DictReader(f))

def prepare():
    docs=[];mapping=[]
    for p in sorted((ROOT/'raw').glob('confirmation_*/answer.json')):
        h=p.parent.name.split('_')[1];b=int(p.parent.name.split('_')[2])
        for w in json.loads(p.read_text())['worlds']:
            docs.append(dict(id=w['id'],memo=w['memo'],public_note=w['public_note']))
            mapping.append(dict(id=w['id'],arm='L',H=h,batch=b,request=p.parent.name))
    assert len(docs)==128 and len({d['id'] for d in docs})==128, 'Incomplete confirmation corpus; preserve failures and stop.'
    for w in json.loads((ROOT/'data/benchmark_documents.json').read_text())['worlds']:
        d={x['type']:x['text'] for x in w['documents']}
        docs.append(dict(id=w['id'],memo=d['internal_memo'],public_note=d['public_note']))
        mapping.append(dict(id=w['id'],arm='oracle_text',H='',batch='',request=''))
    controls=[
        dict(id='CONTROL_UNKNOWN',memo='SYNTHETIC. No record of which notice arrived or of the decision is available.',public_note='SYNTHETIC. We announce our continued support for the proposal.'),
        dict(id='CONTROL_DISCORD',memo='SYNTHETIC. The burden of alternative regulation fell from 12 to 2, with competitive benefit unchanged at 12. We withdrew support.',public_note='SYNTHETIC. We continue supporting the proposal.'),
        dict(id='CONTROL_COMP',memo='SYNTHETIC. Competitive benefit fell from 12 to 2, and alternative-regulation burden stayed at 12. We maintain support.',public_note='SYNTHETIC. We maintain support.')]
    docs+=controls
    mapping += [dict(id=w['id'],arm='control',H='',batch='',request='') for w in controls]
    random.Random(2026101122).shuffle(docs)
    redactions=[];blind=[];codemap=[]
    for i,d in enumerate(docs):
        opaque=f'BLIND_{i+1:03d}'
        dd={k:re.sub(r'\b(?:SA|CA)\b','[HYPOTHESIS LABEL REDACTED]',d[k]) for k in ['memo','public_note']}
        if any(dd[k]!=d[k] for k in dd):redactions.append(d['id'])
        blind.append(dict(id=opaque,**dd));codemap.append(dict(opaque=opaque,id=d['id'],request=f'code_{i//12+1:02d}'))
    (ROOT/'data/documents.json').write_text(json.dumps(docs,indent=2))
    (ROOT/'data/blinded_documents.json').write_text(json.dumps(blind,indent=2))
    (ROOT/'data/label_redactions.json').write_text(json.dumps(redactions,indent=2))
    csvwrite(ROOT/'data/world_map.csv',mapping);csvwrite(ROOT/'data/code_map.csv',codemap)
    print(json.dumps(dict(documents=len(docs),explicit_label_redactions=len(redactions))))

def code():
    schema=obj(dict(model_id=TEXT,worlds=dict(type='array',items=obj(dict(id=TEXT,shock=dict(type='string',enum=['regulatory','competitive','unknown']),internal_support=dict(type='integer',enum=[-1,0,1]),public_support=dict(type='integer',enum=[-1,0,1]),explanation=TEXT)))))
    prompt='''You are an independent documentary coder. Use ONLY the supplied texts. Do not use tools, files, web or background expectations. Report exact model ID or UNKNOWN. The assigned hypothesis, generator and evaluation condition are unavailable. Do not infer the decision from incentives: read what the document says actually happened, even when surprising. shock=regulatory if ONLY the expected burden of alternative regulation fell while the competitive benefit stayed unchanged; competitive if ONLY the competitive benefit fell while alternative-regulation burden stayed unchanged; unknown if not determinable. internal_support=1 when memo states the coalition ACTUALLY maintains support after the notice, 0 when it withdraws, -1 if unknown or contradictory WITHIN the memo. public_support=1 if note announces continued support,0 if announces withdrawal,-1 if ambiguous WITHIN the public note. Disagreement BETWEEN memo and public note is allowed: code each separately, not -1 for both. Do not use hypothetical or counterfactual language as an occurred decision. Give a concise explanation for unknown or disagreement, otherwise empty. The discovered checks compare (1) notice content with later internal decisions and (secondary) (2) notice content with later public announcements. Coding must use only documentary facts, not hypothesis labels. JSON only.\n'''
    payload=json.loads((ROOT/'data/blinded_documents.json').read_text())
    dispatch([(f'code_{i//12+1:02d}',prompt+json.dumps(payload[i:i+12]),schema) for i in range(0,len(payload),12)])

def collect():
    worldmap={x['id']:x for x in csvread(ROOT/'data/world_map.csv')};rows=[];errors=[]
    for m in csvread(ROOT/'data/code_map.csv'):
        try:
            answer=json.loads((ROOT/'raw'/m['request']/'answer.json').read_text())
            matches=[x for x in answer['worlds'] if x['id']==m['opaque']]
            assert len(matches)==1
            r=matches[0];base=worldmap[m['id']]
            rows.append(base|{k:r[k] for k in ['shock','internal_support','public_support','explanation']})
        except Exception as exc:errors.append(dict(id=m['id'],error=str(exc)))
    if rows:csvwrite(ROOT/'data/coded.csv',rows)
    (ROOT/'data/coding_failures.json').write_text(json.dumps(errors,indent=2))
    # C+ translates coded observable states, never rereads H or the oracle.
    templates=[];tr=[]
    for r in rows:
        if r['arm']!='L':continue
        shocktext={'regulatory':'the burden of alternative regulation fell from 12 to 2; competitive benefit stayed at 12','competitive':'competitive benefit fell from 12 to 2; the burden of alternative regulation stayed at 12','unknown':'the notice type is unavailable'}[r['shock']]
        choice={1:'maintains support',0:'withdraws support',-1:'has no codable decision'}
        memo=f'SYNTHETIC. Day 11. After the private notice on day 10, {shocktext}. The coalition {choice[r["internal_support"]]}.'
        note=f'SYNTHETIC. Day 12. The coalition {choice[r["public_support"]]}.'
        templates.append(dict(id=r['id'].replace('confirmation_','template_'),memo=memo,public_note=note))
        # Independent deterministic decoding of this strictly controlled grammar.
        ss='regulatory' if 'burden of alternative regulation fell' in memo else ('competitive' if 'competitive benefit fell' in memo else 'unknown')
        def decode(x):return 1 if 'maintains support' in x else (0 if 'withdraws support' in x else -1)
        tr.append(dict(id=templates[-1]['id'],source_id=r['id'],H=r['H'],shock=ss,internal_support=decode(memo),public_support=decode(note)))
    (ROOT/'data/expanded_templates.json').write_text(json.dumps(templates,indent=2))
    if tr:csvwrite(ROOT/'data/templates_decoded.csv',tr)
    print(json.dumps(dict(coded=len(rows),failures=errors,expanded_templates=len(tr))))

if __name__=='__main__':{'prepare':prepare,'code':code,'collect':collect}[sys.argv[1]]()
