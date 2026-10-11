import csv, hashlib, json, sys, time
from pathlib import Path
from calls import ROOT, TEXT, INT, obj, call, dispatch

FOUNDATIONS=(ROOT/'foundations.txt').read_text()
GUARD='Do not use tools, files, the web, code execution, previous conversations or your own random draws. Report your exact model ID if known, otherwise UNKNOWN. Output JSON only.\n'
world=obj(dict(id=TEXT,S=INT,A=INT,M=INT,P=INT,notice=TEXT,decision_record=TEXT,memo=TEXT,public_note=TEXT))
candidate=obj(dict(id=TEXT,implication=TEXT,derivation=TEXT,extra_assumption=TEXT,indicator=TEXT,category_labels=dict(type='array',items=TEXT),state_table=dict(type='array',items=INT)))
schema=obj(dict(model_id=TEXT,worlds=dict(type='array',items=world),candidates=dict(type='array',items=candidate)))

def discovery():
    draws=list(csv.DictReader((ROOT/'data/controlled_draws.csv').open()))
    tasks=[]
    for name in sorted(set(x['call'] for x in draws)):
        batch=[x for x in draws if x['call']==name]
        prompt=GUARD+FOUNDATIONS+'''
Work through the supplied controlled draws. For each episode write four short synthetic documents (notice, direct decision record, staff memo, public announcement), each at most 45 words. Also return the resulting S,A,M,P state. Documents must state the relevant factual position clearly, including reversals when the supplied draws require them. Do not repair disagreement between records. Do not disclose private numeric benefits in the announcement.
After using the mechanism to generate these documents, formulate up to TWO distinct additional observable implications, beyond restating any single premise. You receive no target list of implications. Think about consequences of combining the mechanism's rules and state which rules jointly imply each. These are diagnostic predictions to check in a separate dataset, not claims of actual history. Extra assumptions must be explicitly named, or NONE. A legitimate failure to find an implication is preferable to invention.
Make each implication executable as ONE categorical row indicator, using only the four observed facts S,A,M,P and no hypothesis label. Explain what each category means. Give its state_table as 16 integer category codes, ordered (S,A,M,P)=0000,0001,0010,...,1111, with P varying fastest. Category codes must be consecutive integers starting at 0. This is a coding rule, not probabilities. A researcher will compute its predictive distribution from the original rules. Use IDs '''+name+'''_C1 and '''+name+'''_C2. Do not add unmodeled actions, sources, dates or latent variables.
CONTROLLED INPUTS:\n'''+json.dumps(batch)
        tasks.append((name,prompt,schema))
    dispatch(tasks)

def select():
    corpus=[]
    for path in sorted((ROOT/'raw').glob('discovery_*/answer.json')):
        corpus.extend(json.loads(path.read_text())['candidates'])
    (ROOT/'data/candidates.json').write_text(json.dumps(corpus,indent=2))
    audit=obj(dict(id=TEXT,admissible=dict(type='boolean'),reason=TEXT))
    s=obj(dict(model_id=TEXT,selected_ids=dict(type='array',items=TEXT),audit=dict(type='array',items=audit)))
    prompt=GUARD+FOUNDATIONS+'''
You are a selector blind to evaluation datasets and faults. From the following ordered candidate corpus, select AT MOST THREE logically valid additional implications, in order of first occurrence. Never create or repair a candidate. Require a consequence of at least two premises and a valid observable coding table matching its prose. Reject auxiliary assumptions, invalid tables, duplicated categorical partitions (including relabeling), and implications that merely restate one premise.
Already available direct checks concern the notice S, residuals Ustar=S xor A, V=A xor M, W=M xor P, and each pair of those three residuals, with H integrated. A candidate that exactly duplicates one of these partitions adds no new check and must be rejected. A relation involving unknown H cannot be treated as observed, though predictions under H can differ.
Keep the first three admissible nonduplicate candidates, even if later ones sound more interesting. Audit every candidate and explain admission/rejection. No performance-based selection is permitted. A mathematically valid new categorical indicator must be selected even if another simpler indicator could also assess its consequence; deduplicate identical partitions only.\nCANDIDATES:\n'''+json.dumps(corpus)
    print(json.dumps(call('select',prompt,s)),flush=True)

if __name__=='__main__':
    {'discovery':discovery,'select':select}[sys.argv[1]]()
