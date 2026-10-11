"""Controlled discovery experiment. Preserve all live authenticated CLI calls."""
import csv, hashlib, json, subprocess, sys, time
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor, as_completed
ROOT=Path(__file__).resolve().parents[1]
CLI='/opt/homebrew/bin/codex'
MODEL='gpt-5.6-sol'
EMPTY=Path('/private/tmp/ppc-carbon-controlled-empty')
EMPTY.mkdir(exist_ok=True)
TEXT={'type':'string'}
INT={'type':'integer'}
def obj(p): return dict(type='object',properties=p,required=list(p),additionalProperties=False)
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

