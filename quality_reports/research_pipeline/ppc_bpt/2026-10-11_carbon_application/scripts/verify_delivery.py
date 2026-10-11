"""Verify source, review and delivery identities. Statistical audit is in R."""
from pathlib import Path
import datetime
import hashlib
import json
import re
import subprocess

BASE = Path(__file__).resolve().parents[1]
REPO = BASE.parents[3]
PDF = REPO / 'output/pdf/aplicacao_carbono_ppc_2026-10-11.pdf'
VISUALLY_REVIEWED_PDF_SHA256 = '405332e8b9ff060675d24220daacb22a50ae9349b0cbe765e01f2e6ac49de15e'
OUT = BASE / 'verification'
OUT.mkdir(exist_ok=True)

def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

checks = {}
source_manifest = json.loads((BASE / 'sources/manifest.json').read_text())
for item in source_manifest:
    name = item['id'] + '.html' if item['status'] == 'archived' else item['id']
    path = BASE / 'sources' / name
    checks['source/' + name] = path.exists() and digest(path) == item['sha256']

audit = json.loads((BASE / 'agents/independent_audit_results.json').read_text())
for relative, expected in audit['reviewed_sha256'].items():
    checks['independent_review/' + relative] = digest(BASE / relative) == expected
checks['independent_numerical_audit_passed'] = audit['status'] == 'PASS'
codebook = json.loads((BASE / 'data/evidence_codebook.json').read_text())
checks['conditioning_source_correction'] = codebook['conditioning']['source_ids'] == ['F1', 'F2']
review = (BASE / 'agents/report_review.md').read_text()
checks['report_review_identity'] = digest(BASE / 'report.md') in review

pdf_info = subprocess.check_output(['pdfinfo', str(PDF)], text=True)
pages = int(re.search(r'^Pages:\s+(\d+)', pdf_info, re.M).group(1))
pdf_text = subprocess.check_output(['pdftotext', str(PDF), '-'], text=True)
checks['pdf_page_count'] = pages == 7
checks['pdf_matches_visual_review'] = digest(PDF) == VISUALLY_REVIEWED_PDF_SHA256
checks['pdf_has_all_table_captions'] = all(re.search(rf'Tabela\s*{n}\s*:', pdf_text) for n in range(1, 8))
checks['pdf_has_figure_caption'] = bool(re.search(r'Figura\s*1\s*:', pdf_text))
checks['pdf_text_present'] = len(pdf_text) > 16000
checks['pdf_final_section_present'] = 'Entrega reproduzível' in pdf_text
checks['report_placeholders_resolved'] = '{{' not in (BASE / 'report.md').read_text()

manuscripts = {}
for name in ['paper_draft_v1.Rmd', 'supplementary_materials.md']:
    baseline = subprocess.check_output(['git', 'show', 'HEAD:' + name], cwd=REPO)
    current = (REPO / name).read_bytes()
    checks['manuscript_unchanged/' + name] = current == baseline
    manuscripts[name] = digest(REPO / name)

artifact_hashes = {}
for path in sorted(BASE.rglob('*')):
    relative = path.relative_to(BASE)
    if path.is_file() and relative.parts[0] != 'verification' and '__pycache__' not in relative.parts:
        artifact_hashes[str(relative)] = digest(path)
artifact_hashes['../../../../output/pdf/aplicacao_carbono_ppc_2026-10-11.pdf'] = digest(PDF)

result = {
    'checked_at_utc': datetime.datetime.now(datetime.timezone.utc).isoformat(),
    'status': 'PASS' if all(checks.values()) else 'FAIL',
    'checks': checks,
    'pdf_pages': pages,
    'pdf_sha256': digest(PDF),
    'pdf_visual_review': {
        'performed_by': 'coordenador',
        'reviewed_pdf_sha256': VISUALLY_REVIEWED_PDF_SHA256,
        'applies_to_current_pdf': digest(PDF) == VISUALLY_REVIEWED_PDF_SHA256,
        'pages_inspected': list(range(1, 8)),
        'render_directory': 'verification/rendered_final',
        'result': 'Sem corte, sobreposição ou perda de texto. Tabelas e equações conferidas nas sete páginas.'
    },
    'manuscript_sha256': manuscripts,
    'artifact_sha256': artifact_hashes,
    'scope': 'Identidade da entrega e proveniência. A auditoria numérica independente e a sensibilidade delimitam a inferência condicional.'
}
(OUT / 'delivery_verification.json').write_text(json.dumps(result, ensure_ascii=False, indent=2) + '\n')
print(json.dumps({'status': result['status'], 'checks': len(checks), 'pdf_pages': pages,
                  'failed': [key for key, value in checks.items() if not value]}, ensure_ascii=False))
if result['status'] != 'PASS':
    raise SystemExit(1)
