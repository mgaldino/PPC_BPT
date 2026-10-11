"""Verify frozen artifacts, live-call records, coding, and numerical exports."""
import csv, hashlib, json, sys, time, os
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
REPO=ROOT.parents[3]
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def readcsv(p):return list(csv.DictReader(p.open()))
manifest=ROOT/'verification/manifest.json'
if '--check-manifest' in sys.argv:
    m=json.loads(manifest.read_text())
    errors=[x for x,v in m.items() if not (ROOT/x).exists() or sha(ROOT/x)!=v]
    print(json.dumps(dict(files=len(m),mismatches=errors),indent=2));sys.exit(bool(errors))
checks=[]
for filename in ['design_freeze.json','selection_freeze.json','addendum_freeze.json']:
    d=json.loads((ROOT/'verification'/filename).read_text())
    for f,h in d['sha256'].items():assert sha(ROOT/f)==h,(filename,f)
    checks.append(filename+': hashes match')
statuses=[json.loads(p.read_text()) for p in sorted((ROOT/'raw').glob('*/status.json'))]
assert len(statuses)==13
assert all(s['returncode']==0 and s['answer_exists'] and not s['tool_events'] for s in statuses)
for s in statuses:assert sha(ROOT/'prompts'/f"{s['name']}.txt")==s['prompt_sha256']
checks.append('13 completed live calls, 0 model tool events, prompt hashes match')
truth={x['id']:x for x in readcsv(ROOT/'data/controlled_truth.csv')}
mapping={x['blind_id']:x for x in json.loads((ROOT/'data/blind_mapping.json').read_text())}
ind=readcsv(ROOT/'agents/independent_document_codes.csv')
assert len(ind)==48 and len({x['id'] for x in ind})==48
matches=0
for x in ind:
    t=truth[mapping[x['id']]['id']]
    for f in ['S','A','M','P']:matches+=int(int(x[f])==int(t[f]))
assert matches==192
checks.append('Independent blinded audit: 192/192 fields match controlled R truth')
for f,expected in [('generation_fidelity.csv',96),('coding_fidelity.csv',192)]:
    a=readcsv(ROOT/'results'/f);assert len(a)==expected and sum(int(x['correct']) for x in a)==expected
rates=readcsv(ROOT/'results/rejection_rates.csv')
assert len(rates)==72
for x in rates:assert int(x['n_datasets'])==5000 and abs(float(x['rate'])-int(x['n_reject'])/5000)<1e-14
checks.append('72 rates correspond to integer counts / 5000')
for name,h in [('paper_draft_v1.Rmd','8bcda550633f3d55369a9c4b26d8732d2da73ecb086c506c8d6e53634939446f'),('supplementary_materials.md','8a6e700c259d8a65117bef025d05ff623740c9229c01c0c6146971aec3dda84a')]:
    assert sha(REPO/name)==h,(name,str(REPO))
checks.append('Original manuscript and supplement hashes unchanged')
usage={k:sum(u.get(k,0) for s in statuses for u in s.get('usage',[])) for k in ['input_tokens','output_tokens','reasoning_output_tokens']}
summary=dict(verified_utc=time.strftime('%Y-%m-%dT%H:%M:%SZ',time.gmtime()),checks=checks,live_calls=13,usage=usage,model_alias_requested=sorted(set(x['model_alias_requested'] for x in statuses)),self_reports=sorted(set(x.get('model_id_self_reported','UNKNOWN') for x in statuses)),independent_fields_correct=matches,generated_worlds=24,document_bundles=48,evaluation_datasets=60000,reference_datasets=300000,primary_N=96)
pdf=REPO/'output/pdf/piloto_carbono_sorteios_controlados_2026-10-11.pdf'
if pdf.exists():summary['report_pdf']={'path':str(pdf),'sha256':sha(pdf)}
(ROOT/'verification/summary.json').write_text(json.dumps(summary,indent=2))
files=[p for p in ROOT.rglob('*') if p.is_file() and '__pycache__' not in str(p) and p!=manifest]
entries={str(p.relative_to(ROOT)):sha(p) for p in sorted(files)}
if pdf.exists():entries[os.path.relpath(pdf,ROOT)]=sha(pdf)
manifest.write_text(json.dumps(entries,indent=2))
print(json.dumps(summary,indent=2))
