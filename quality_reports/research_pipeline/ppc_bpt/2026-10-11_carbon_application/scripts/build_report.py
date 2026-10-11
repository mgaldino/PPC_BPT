"""Format existing R outputs into the report. No statistical estimation here."""
from pathlib import Path
import csv

ROOT = Path(__file__).resolve().parents[1]
def rows(name):
    with (ROOT / 'results' / name).open(encoding='utf-8') as handle:
        return list(csv.DictReader(handle))
def pct(value, digits=2):
    return (f'{100 * float(value):.{digits}f}').replace('.', ',') + '%'
def num(value, digits=3):
    return f'{float(value):.{digits}f}'.replace('.', ',')
def table(caption, headers, content, widths=None):
    separators = [':' + '-' * (width - 1) for width in widths] if widths else [':--'] * len(headers)
    return '\n'.join(['Table: ' + caption, '', '| ' + ' | '.join(headers) + ' |', '| ' + ' | '.join(separators) + ' |'] + ['| ' + ' | '.join(row) + ' |' for row in content])

c = rows('central_results.csv')[0]
chain = rows('published_posterior_chain.csv')
replacements = {
    'M0_SA': pct(c['M0_posterior_SA']), 'M1_SA': pct(c['M1_posterior_SA']),
    'M1_CA': pct(c['M1_posterior_CA']), 'M1_HR': pct(c['M1_posterior_HR']),
    'PPC0': pct(c['M0_PPC_account_tail']), 'PPC1': pct(c['M1_PPC_account_tail']),
    'MASS0': pct(c['M0_posterior_predictive_observed']), 'MASS1': pct(c['M1_posterior_predictive_observed']),
    'BF_R': num(c['BF_HR_vs_old'], 1), 'FC_SA': '71,53%', 'FC_SA_MATH': '71{,}53\\%',
    'RHO_THRESHOLD': pct(c['rho_threshold_HR_majority']), 'DR_THRESHOLD': pct(c['dR_threshold_HR_majority']),
    'GRID_N': format(len(rows('sensitivity_full_grid.csv')), ',').replace(',', '.')
}
replacements['FC_TABLE'] = table('Evidências e julgamentos publicados por FC. Valores positivos favorecem SA. Resumos dos pacotes originais.', ['Entrada', 'Conteúdo', 'Peso SA:CA'], [
    ['Prior', 'Literatura anterior', '+6 dB'],
    ['E1', 'Apoio de empresas europeias à precificação e expansão do gás, 2015', '−4 dB'],
    ['E2', 'Pedido para os EUA permanecerem em Paris, 2017', '−3 dB'],
    ['E3', 'Coalizão CLC, desenho tributário, compensações e financiamento', '+12 dB'],
    ['E4', 'Projeções para investidores sobre gás e preço do carbono, 2018–2019', '−7 dB']
], widths=[15, 65, 20])
kernel = rows('central_kernel.csv')
# Require the implementation's declared 3x3 probabilities, preserving its row order.
state_names = {'no_account': 'Ausência de Q; resposta fora do ramo', 'account_no_denial': 'Q presente, sem desautorização', 'account_denial': 'Q presente, com desautorização (observado)'}
if set(('state','hypothesis','likelihood','model')).issubset(kernel[0]):
    km = {(r['state'],r['hypothesis']):r['likelihood'] for r in kernel if r['model']=='M1'}
    kernel_content = [[label] + [pct(km[(state,h)],1) for h in ('SA','CA','HR')] for state,label in state_names.items()]
else:
    raise ValueError('Unexpected kernel schema: '+str(kernel[0]))
replacements['KERNEL_TABLE'] = table('Modelo gerador completo. Probabilidade de cada estado observado sob cada hipótese, após os julgamentos centrais.', ['Estado replicável', 'SA', 'CA', 'HR'], kernel_content)
replacements['POSTERIOR_TABLE'] = table('Atualização da explicação local. O produto prior × likelihood é normalizado pelo total 0,207.', ['Hipótese', 'Prior', 'Likelihood de Q=1,V=1', 'Produto', 'Posterior'], [
    ['SA', '40%', '13,5%', '0,054', pct(c['M1_posterior_SA'])],
    ['CA', '40%', '9,0%', '0,036', pct(c['M1_posterior_CA'])],
    ['HR', '20%', '58,5%', '0,117', pct(c['M1_posterior_HR'])]
])
labels = {
    'central': 'Referência central',
    'more_false_accounts': 'Relato sob SA e CA: 30% em ambas',
    'lower_prior_HR': 'Prior de HR: 10%',
    'less_disclosure_under_HR': 'Relato sob HR: 40%',
    'half_denial_under_HR': 'Desautorização sob HR: 45%',
    'equal_account_likelihoods': 'Relato sob SA e CA: 12,5% em ambas',
}
focal = {r['scenario']:r for r in rows('focal_sensitivity.csv')}
if 'half_denial_under_HR' not in focal:
    matches = [r for r in focal.values() if abs(float(r['d_R'])-.45)<1e-10]
    if matches: focal['half_denial_under_HR'] = matches[0]
replacements['SENSITIVITY_TABLE'] = table('Efeito de mudanças de julgamento sobre a conclusão. As fontes e o padrão observado permanecem fixos.', ['Julgamento alterado', 'Posterior SA', 'Posterior CA', 'Posterior HR', 'PPC inicial'], [[label, pct(focal[key]['M1_posterior_SA'],1), pct(focal[key]['M1_posterior_CA'],1), pct(focal[key]['M1_posterior_HR'],1), pct(focal[key]['M0_PPC_account_tail'],1)] for key,label in labels.items()], widths=[40, 15, 15, 15, 15])
replacements['FC_COMPLETION_TABLE'] = table('Sensibilidade do PPC conjunto dos quatro pacotes originais. Âncoras e completamento são pressupostos desta auditoria. Cada linha enumera todos os 16 padrões.', ['Probabilidade na hipótese favorecida', 'Posterior SA', 'Massa do padrão observado', 'Cauda PPC conjunta'], [[pct(r['favored_anchor'],0), pct(r['posterior_SA']), pct(r['posterior_probability_observed']), pct(r['PPC_probability_mass_rank'])] for r in rows('FC_completion_sensitivity.csv')])
text = (ROOT / 'report_template.md').read_text(encoding='utf-8')
# The argument and elicitation prose describe the frozen central application.
# A changed parameter set can always regenerate CSV/RDS outputs, but needs a
# revised narrative before rebuilding this report as if it were the same study.
expected = {'pi':.5, 'rho':.2, 'epsilon_SA':.15, 'epsilon_CA':.1, 'lambda_R':.65, 'd_SA':.9, 'd_CA':.9, 'd_R':.9}
if any(abs(float(c[key])-value)>1e-12 for key,value in expected.items()):
    raise ValueError('Central judgments changed: revise report_template.md and this report guard to describe the new application before rendering.')
for key, value in replacements.items(): text = text.replace('{{'+key+'}}', value)
if '{{' in text: raise ValueError('Unresolved report placeholder')
(ROOT / 'report.md').write_text(text, encoding='utf-8')
print(ROOT / 'report.md')
