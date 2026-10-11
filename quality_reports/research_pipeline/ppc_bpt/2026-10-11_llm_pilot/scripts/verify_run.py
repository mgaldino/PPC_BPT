"""Audit completeness, controls, state copying, and raw/derived provenance."""
import csv, hashlib, json
from pathlib import Path
R=Path(__file__).resolve().parents[1]
def csvrows(p):
    with open(p,encoding='utf-8') as f:return list(csv.DictReader(f))
docs=json.loads((R/'data/documents.json').read_text())
worlds={x['id']:x for x in csvrows(R/'data/worlds.csv')}
mapping=csvrows(R/'data/request_map.csv')
checks={}
checks['main_worlds']=len(worlds)
checks['generation_failures']=json.loads((R/'data/failures.json').read_text())
checks['unexpected_raw_ids']={}
for req in sorted(set(m['request'] for m in mapping)):
    expected={m['raw_id'] for m in mapping if m['request']==req}
    actual=[w['id'] for w in json.loads((R/'raw'/req/'answer.json').read_text())['worlds']]
    if set(actual)!=expected or len(actual)!=len(expected):checks['unexpected_raw_ids'][req]=actual
checks['B_returned_state_mismatches']=[d['id'] for d in docs if d['id'].startswith('B_') and
    any(int(d['returned_state'][v])!=int(worlds[d['id']][v]) for v in ['Q','K','A'])]
checks['word_limit_violations']=[dict(id=d['id'],document=v,words=len(d[v].split()))
   for d in docs for v in ['memo','public_note'] if len(d[v].split())>45]
control=json.loads((R/'raw/gen_control/answer.json').read_text())['worlds']
checks['deterministic_control_states']=[{v:w[v] for v in ['id','Q','K','A']} for w in control]
checks['deterministic_control_pass']=len(control)==4 and all((w['Q'],w['K'],w['A'])==(1,0,1) for w in control)
statuses=[json.loads(p.read_text()) for p in sorted((R/'raw').glob('*/status.json'))]
checks['completed_calls']=len(statuses)
checks['model_aliases']=sorted(set(s['model_alias_requested'] for s in statuses))
checks['nonzero_returncodes']=[s['name'] for s in statuses if s.get('returncode')!=0]
checks['tool_calls']=[dict(request=s['name'],events=s['tool_events']) for s in statuses if s['tool_events']]
checks['output_tokens']=sum(u.get('output_tokens',0) for s in statuses for u in s['usage'])
if (R/'data/coded.csv').exists():
    coded={d['id']:d for d in csvrows(R/'data/coded.csv')}
    checks['coding_failures']=json.loads((R/'data/coding_failures.json').read_text())
    checks['coding_controls']={k:v for k,v in coded.items() if k.startswith('AUDIT_')}
    checks['coding_control_pass']=(coded['AUDIT_CONTRA_A']['contradiction']=='True' and
        coded['AUDIT_CONTRA_A']['A_c']=='-1' and coded['AUDIT_CONTRA_Q']['contradiction']=='True' and
        coded['AUDIT_CONTRA_Q']['Q_c']=='-1' and coded['AUDIT_UNKNOWN_K']['K_c']=='-1')
    blind=R/'agents/blind_audit.csv'
    if blind.exists():
        codemap={m['opaque']:m['id'] for m in csvrows(R/'data/code_map.csv')}
        audit=csvrows(blind)
        checks['independent_blind_n']=len(audit)
        checks['independent_blind_disagreements']=[dict(opaque=a['opaque'],id=codemap[a['opaque']],
            field=v,independent=a[v],coder=coded[codemap[a['opaque']]][v]) for a in audit
            for v in ['Q_c','K_c','A_c','contradiction']
            if a[v].lower()!=coded[codemap[a['opaque']]][v].lower()]
(R/'verification/run_audit.json').write_text(json.dumps(checks,ensure_ascii=False,indent=2))
manifest=[]
for p in sorted(R.rglob('*')):
    if p.is_file() and '__pycache__' not in str(p) and p.name not in ['sha256_manifest.csv','last_verification_output.json']:
        manifest.append(dict(path=str(p.relative_to(R)),bytes=p.stat().st_size,
            sha256=hashlib.sha256(p.read_bytes()).hexdigest()))
with open(R/'verification/sha256_manifest.csv','w',newline='') as f:
    w=csv.DictWriter(f,fieldnames=['path','bytes','sha256']);w.writeheader();w.writerows(manifest)
print(json.dumps(checks,ensure_ascii=False,indent=2))
