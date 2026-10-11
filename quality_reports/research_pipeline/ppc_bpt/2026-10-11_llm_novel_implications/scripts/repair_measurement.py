"""Document a measurement-rule correction. Never replace the strict raw coding."""
import csv,json,random,sys
from run_novel import ROOT,TEXT,obj,dispatch
from code_novel import csvread,csvwrite

def prepare():
    rows=csvread(ROOT/'data/coded.csv')
    byid={r['id']:r for r in rows};cm=csvread(ROOT/'data/code_map.csv')
    docs={d['id']:d for d in json.loads((ROOT/'data/blinded_documents.json').read_text())}
    target=[m for m in cm if byid[m['id']]['arm']=='L' and byid[m['id']]['shock']=='unknown']
    target += [m for m in cm if byid[m['id']]['arm']=='control']
    known=[m for m in cm if byid[m['id']]['arm']!='control' and byid[m['id']]['shock']!='unknown']
    rng=random.Random(2026101125);target+=rng.sample(known,8);rng.shuffle(target)
    payload=[]
    for i,m in enumerate(target):
        m['repair_request']=f'repair_{i//12+1:02d}';payload.append(docs[m['opaque']])
    csvwrite(ROOT/'data/repair_map.csv',target)
    (ROOT/'data/repair_documents.json').write_text(json.dumps(payload,indent=2))

def code():
    schema=obj(dict(model_id=TEXT,worlds=dict(type='array',items=obj(dict(id=TEXT,
      shock=dict(type='string',enum=['regulatory','competitive','unknown']),
      basis=dict(type='string',enum=['direct_channel','design_inference','unidentified']),evidence=TEXT)))))
    prompt='''Independent documentary measurement audit. No tools, files, web or prior answers. Report exact model ID or UNKNOWN. Identify ONLY the CHANNEL OF THE PRIVATE NOTICE from the text, not whether every assumption is repeated. shock=regulatory if the text says the notice revised/reduced the burden of alternative regulation; competitive if the text says the notice revised/reduced the competitive benefit. Do not require the document also to say that the other dimension stayed unchanged. In these fictional worlds it is a STIPULATED DESIGN RULE that exactly one of these two dimensions fell from12to2 and the other stayed12. If a memo only states that one dimension stayed unchanged after the notice and does not explicitly identify which changed, the OTHER channel can be inferred solely under that design rule; basis=design_inference. Never infer from support/withdrawal or from hypothesis names. basis=direct_channel when the notice's channel is itself explicitly named, even if the direction or unaffected other dimension is omitted. basis=unidentified and shock=unknown if neither direct text nor the stipulated rule suffices. Provide a short exact evidence excerpt and qualify any design inference. Public-note support is irrelevant for coding this field. JSON only.\n'''
    docs=json.loads((ROOT/'data/repair_documents.json').read_text())
    dispatch([(f'repair_{i//12+1:02d}',prompt+json.dumps(docs[i:i+12]),schema) for i in range(0,len(docs),12)])

def collect():
    rows=csvread(ROOT/'data/coded.csv');byid={x['id']:x for x in rows};audit=[]
    for m in csvread(ROOT/'data/repair_map.csv'):
        response=json.loads((ROOT/'raw'/m['repair_request']/'answer.json').read_text())
        matches=[x for x in response['worlds'] if x['id']==m['opaque']];assert len(matches)==1
        x=matches[0];old=byid[m['id']]
        audit.append(dict(id=m['id'],old_shock=old['shock'],new_shock=x['shock'],basis=x['basis'],evidence=x['evidence']))
    auditmap={x['id']:x for x in audit}
    for r in rows:
        a=auditmap.get(r['id'])
        r['shock_basis']=a['basis'] if a else 'strict_coder'
        if a:r['shock']=a['new_shock']
    csvwrite(ROOT/'data/measurement_audit.csv',audit)
    csvwrite(ROOT/'data/coded_analysis.csv',rows)
    # Recompile the existing deterministic template function on corrected codes,
    # preserving original strict templates separately.
    templates=[];decoded=[]
    for r in rows:
        if r['arm']!='L':continue
        st={'regulatory':'the notice concerned alternative regulation','competitive':'the notice concerned competitive benefit','unknown':'notice content is unavailable'}[r['shock']]
        choice={'1':'maintains support','0':'withdraws support','-1':'has no codable decision'}
        memo=f'SYNTHETIC. Day 11. {st}. The coalition {choice[r["internal_support"]]}.'
        note=f'SYNTHETIC. Day 12. The coalition {choice[r["public_support"]]}.'
        id_=r['id'].replace('confirmation_','template_')
        templates.append(dict(id=id_,memo=memo,public_note=note))
        shock='regulatory' if 'notice concerned alternative regulation' in memo else ('competitive' if 'notice concerned competitive benefit' in memo else 'unknown')
        def dec(s):return 1 if 'maintains support' in s else (0 if 'withdraws support' in s else -1)
        decoded.append(dict(id=id_,source_id=r['id'],H=r['H'],shock=shock,internal_support=dec(memo),public_support=dec(note)))
    (ROOT/'data/expanded_templates_analysis.json').write_text(json.dumps(templates,indent=2))
    csvwrite(ROOT/'data/templates_analysis_decoded.csv',decoded)
    print(json.dumps(dict(recoded=len(audit),changed=sum(x['old_shock']!=x['new_shock'] for x in audit),bases={b:sum(x['basis']==b for x in audit) for b in ['direct_channel','design_inference','unidentified']})))

if __name__=='__main__':{'prepare':prepare,'code':code,'collect':collect}[sys.argv[1]]()
