import csv, hashlib, json, random, sys
from calls import ROOT, TEXT, INT, obj, dispatch

FIELDS=['S','A','M','P']
DOCS=['notice','decision_record','memo','public_note']
def readcsv(name): return list(csv.DictReader((ROOT/'data'/name).open()))
def dumpcsv(name,rows):
    with (ROOT/'results'/name).open('w') as f:
        w=csv.DictWriter(f,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)

def template(t):
    s,a,m,p=[int(t[k]) for k in FIELDS]
    pos=lambda z:'maintains support' if z else 'withdraws support'
    return dict(id=t['id'],S=s,A=a,M=m,P=p,
      notice='SYNTHETIC. Private notice: '+('the competitive benefit falls from 12 to 2; the regulatory benefit stays at 12.' if s else 'the regulatory benefit falls from 12 to 2; the competitive benefit stays at 12.'),
      decision_record='SYNTHETIC. Direct decision record: the coalition '+pos(a)+'.',
      memo='SYNTHETIC. Next-day staff memorandum: the coalition '+pos(m)+'.',
      public_note='SYNTHETIC. Following-day public announcement: the coalition '+pos(p)+'.')

def prepare():
    worlds=[]
    for p in sorted((ROOT/'raw').glob('discovery_*/answer.json')):
        worlds.extend(json.loads(p.read_text())['worlds'])
    truth=readcsv('controlled_truth.csv');truthmap={r['id']:r for r in truth}
    assert len(worlds)==24 and set(x['id'] for x in worlds)==set(truthmap)
    templates=[template(t) for t in truth]
    (ROOT/'data/generated_worlds.json').write_text(json.dumps(worlds,indent=2))
    (ROOT/'data/template_worlds.json').write_text(json.dumps(templates,indent=2))
    combined=[dict(arm=arm,world=w) for arm,ws in [('AI',worlds),('template',templates)] for w in ws]
    random.Random(2026101145).shuffle(combined)
    blinded=[];mapping=[]
    for i,x in enumerate(combined):
        bid=f'B{i+1:03d}'
        blinded.append(dict(id=bid,**{k:x['world'][k] for k in DOCS}))
        mapping.append(dict(blind_id=bid,arm=x['arm'],id=x['world']['id']))
    (ROOT/'data/blind_documents.json').write_text(json.dumps(blinded,indent=2))
    (ROOT/'data/blind_mapping.json').write_text(json.dumps(mapping,indent=2))
    rows=[]
    for w in worlds:
        t=truthmap[w['id']]
        for k in FIELDS:rows.append(dict(id=w['id'],field=k,truth=int(t[k]),reported=w[k],correct=int(int(t[k])==w[k])))
    dumpcsv('generation_fidelity.csv',rows)
    print('Prepared 48 blinded document bundles. Generator state matches:',sum(r['correct'] for r in rows),'/',len(rows))

def code():
    docs=json.loads((ROOT/'data/blind_documents.json').read_text())
    item=obj(dict(id=TEXT,S=INT,A=INT,M=INT,P=INT,basis=TEXT))
    schema=obj(dict(model_id=TEXT,records=dict(type='array',items=item)))
    tasks=[]
    for i in range(0,len(docs),8):
        prompt='''Do not use tools or outside knowledge. Report exact model ID or UNKNOWN. You are a document coder, not an investigator of causal hypotheses. Code ONLY what each document explicitly says. S=0 means the private notice says regulatory benefit falls; S=1 means competitive benefit falls. A is the coalition position in the direct decision record; M is its position in the staff memorandum; P is its position in the public announcement. For A,M,P code 1 for support and 0 for withdrawal/non-support. A memo may differ from the decision record, and the public announcement may differ from the memo. Preserve each document's statement separately; do not correct disagreements. Code -1 for a missing or ambiguous field. Do not infer S from the stance. Return all IDs exactly once. Give a short basis. Output JSON only.\nDOCUMENTS:\n'''+json.dumps(docs[i:i+8])
        tasks.append((f'coding_{i//8+1:02d}',prompt,schema))
    dispatch(tasks)

def collect():
    decoded=[]
    for p in sorted((ROOT/'raw').glob('coding_*/answer.json')):
        decoded.extend(json.loads(p.read_text())['records'])
    mapping={x['blind_id']:x for x in json.loads((ROOT/'data/blind_mapping.json').read_text())}
    truth={r['id']:r for r in readcsv('controlled_truth.csv')}
    assert len(decoded)==48 and len(set(r['id'] for r in decoded))==48
    assert set(r['id'] for r in decoded)==set(mapping)
    rows=[]
    for r in decoded:
        m=mapping[r['id']];t=truth[m['id']]
        for k in FIELDS:rows.append(dict(blind_id=r['id'],id=m['id'],arm=m['arm'],field=k,truth=int(t[k]),coded=r[k],correct=int(int(t[k])==r[k]),basis=r['basis']))
    dumpcsv('coding_fidelity.csv',rows)
    (ROOT/'data/coded_documents.json').write_text(json.dumps(decoded,indent=2))
    print('Blind coding matches:',sum(x['correct'] for x in rows),'/',len(rows))

if __name__=='__main__':{'prepare':prepare,'code':code,'collect':collect}[sys.argv[1]]()
