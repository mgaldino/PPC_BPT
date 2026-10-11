"""Structural and provenance verification. A PASS is not scientific validation."""
import csv,hashlib,json,sys
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
REPO=ROOT.parents[3]
PDF=REPO/'output/pdf/piloto_carbono_implicacoes_novas_2026-10-11.pdf'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def read(p):
    with p.open() as f:return list(csv.DictReader(f))
manifest=ROOT/'verification/manifest.json'
if '--check-manifest' in sys.argv:
    items=json.loads(manifest.read_text())
    bad=[x['path'] for x in items if not (REPO/x['path']).exists() or sha(REPO/x['path'])!=x['sha256']]
    print(json.dumps(dict(checked=len(items),mismatches=bad)))
    assert not bad
    raise SystemExit
statuses=[json.loads(p.read_text()) for p in (ROOT/'raw').glob('*/status.json')]
assert len(statuses)==40
assert all(x.get('returncode')==0 and x.get('answer_exists') for x in statuses)
assert all(not x['tool_events'] for x in statuses)
for s in statuses:
    assert sha(ROOT/'prompts'/f'{s["name"]}.txt')==s['prompt_sha256']
    json.loads((ROOT/'raw'/s['name']/'answer.json').read_text())
from run_novel import COMMON
for stage,nb,nw in [('discovery',2,4),('confirmation',8,8)]:
    for h in ['SA','CA']:
        for b in range(1,nb+1):
            name=f'{stage}_{h}_{b:02d}'
            p=(ROOT/'prompts'/f'{name}.txt').read_text()
            assert p.startswith(COMMON)
            worlds=json.loads((ROOT/'raw'/name/'answer.json').read_text())['worlds']
            expected={f'{stage}_{h}_{b:02d}_{i:02d}' for i in range(1,nw+1)}
            assert {w['id'] for w in worlds}==expected and len(worlds)==nw
freeze=json.loads((ROOT/'data/analysis_freeze.json').read_text())
assert sha(ROOT/'data/codebook.json')==freeze['selection_sha256']
assert sha(ROOT/'data/oracle_rules.json')=='0e44ac0e7e0072586da6864dd068f81757ddf197a0c4b4e3ccbbd2557e2a5d16'
assert sha(ROOT/'data/benchmark.csv')=='11bc0c38f6b3e8ccf7371ce4c0a8d890f962e6789dd6b69e8b1fb0b5d72a153e'
assert sha(REPO/'paper_draft_v1.Rmd')=='8bcda550633f3d55369a9c4b26d8732d2da73ecb086c506c8d6e53634939446f'
assert sha(REPO/'supplementary_materials.md')=='8a6e700c259d8a65117bef025d05ff623740c9229c01c0c6146971aec3dda84a'
code=read(ROOT/'data/coded_analysis.csv');byid={x['id']:x for x in code}
assert len(code)==len(byid)==167
assert sum(x['arm']=='L' for x in code)==128
assert not json.loads((ROOT/'data/coding_failures.json').read_text())
cmap={x['opaque']:x['id'] for x in read(ROOT/'data/code_map.csv')}
ind=read(ROOT/'agents/independent_coding.csv');agree=[]
for x in ind:
    y=byid[cmap[x['id']]]
    for k in ['shock','internal_support','public_support']:
        agree.append(dict(opaque=x['id'],field=k,independent=x[k],coded=y[k],agree=x[k]==y[k]))
assert all(x['agree'] for x in agree)
with (ROOT/'verification/independent_coding_agreement.csv').open('w',newline='') as f:
    w=csv.DictWriter(f,fieldnames=list(agree[0]));w.writeheader();w.writerows(agree)
expected={'CONTROL_UNKNOWN':('unknown','-1','1'),'CONTROL_DISCORD':('regulatory','0','1'),'CONTROL_COMP':('competitive','1','1')}
for id_,v in expected.items():assert tuple(byid[id_][k] for k in ['shock','internal_support','public_support'])==v
oracle=read(ROOT/'results/coding_oracle_audit.csv');assert len(oracle)==36 and all(x['correct']=='TRUE' for x in oracle)
tpl=read(ROOT/'data/templates_analysis_decoded.csv');assert len(tpl)==128
for x in tpl:
    y=byid[x['source_id']]
    assert all(x[k]==y[k] for k in ['shock','internal_support','public_support'])
counts=read(ROOT/'results/exact_distribution_checks.csv')
assert all(abs(float(x['total_mass'])-1)<1e-9 and float(x['self_rejection'])<=.05000001 for x in counts)
for name in ['ppc_scores.csv','textual_ppc.csv','explicit_premise_ppc.csv']:
    assert all(0<=float(x['ppc'])<=1 for x in read(ROOT/'results'/name))
assert len(read(ROOT/'results/ppc_scores.csv'))==18000
assert PDF.exists() and PDF.stat().st_size>10000
summary=dict(status='PASS_STRUCTURAL_AND_PROVENANCE_NOT_HISTORICAL_VALIDATION',
    cli_calls=40,tool_events=0,discovery_worlds=16,confirmation_worlds=128,
    oracle_datasets=3000,oracle_worlds=36000,oracle_textual_worlds=36,
    independent_pairs=len(ind),independent_fields=len(agree),independent_fields_agree=sum(x['agree'] for x in agree),
    oracle_fields_agree=108,template_worlds_agree=128,ppc_scores=18000,
    strict_unknown_channels=44,repaired_direct=41,repaired_design_inference=3,
    manuscript_unchanged=True,supplement_unchanged=True,pdf_path=str(PDF),
    usage={k:sum(u.get(k,0) for s in statuses for u in s.get('usage',[]) if u) for k in ['input_tokens','output_tokens']})
(ROOT/'verification/summary.json').write_text(json.dumps(summary,indent=2))
paths=[p for p in ROOT.rglob('*') if p.is_file() and '__pycache__' not in p.parts and p!=manifest and 'rendered' not in p.parts]+[PDF]
items=[dict(path=str(p.relative_to(REPO)),sha256=sha(p),bytes=p.stat().st_size) for p in sorted(paths)]
manifest.write_text(json.dumps(items,indent=2))
print(json.dumps(summary,indent=2));print('Manifest files:',len(items))
