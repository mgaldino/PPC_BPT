"""Archive public source bytes and readable HTML text without changing old inputs."""
from pathlib import Path
from urllib.request import Request, urlopen
from html.parser import HTMLParser
import datetime, hashlib, json, shutil

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / 'sources'
OUT.mkdir(exist_ok=True)

class TextParser(HTMLParser):
    def __init__(self):
        super().__init__()
        self.parts, self.skip = [], 0
    def handle_starttag(self, tag, attrs):
        if tag in ('script', 'style'):
            self.skip += 1
        if tag in ('p', 'div', 'h1', 'h2', 'h3', 'li', 'br'):
            self.parts.append('\n')
    def handle_endtag(self, tag):
        if tag in ('script', 'style') and self.skip:
            self.skip -= 1
        if tag in ('p', 'div', 'h1', 'h2', 'h3', 'li'):
            self.parts.append('\n')
    def handle_data(self, data):
        if not self.skip:
            self.parts.append(data)

items = [
    ('exxon_2021_03_29', 'https://corporate.exxonmobil.com/news/viewpoints/supports-carbon-pricing'),
    ('unearthed_2021_06_30', 'https://unearthed.greenpeace.org/2021/06/30/exxon-climate-change-undercover/'),
    ('exxon_2021_07_02', 'https://corporate.exxonmobil.com/news/news-releases/statements/our-position-on-climate-policy-and-carbon-pricing'),
]
manifest = []
for name, url in items:
    dest = OUT / (name + '.html')
    record = {'id': name, 'url': url, 'accessed_at_utc': datetime.datetime.now(datetime.timezone.utc).isoformat()}
    try:
        if not dest.exists():
            req = Request(url, headers={'User-Agent': 'Mozilla/5.0 (academic source verification)'})
            with urlopen(req, timeout=40) as response:
                raw = response.read()
                record['final_url'] = response.url
            dest.write_bytes(raw)
        raw = dest.read_bytes()
        p = TextParser()
        p.feed(raw.decode('utf-8', errors='replace'))
        cleaned = '\n'.join(line.strip() for line in ''.join(p.parts).splitlines() if line.strip())
        (OUT / (name + '.txt')).write_text(cleaned + '\n', encoding='utf-8')
        record.update(status='archived', sha256=hashlib.sha256(raw).hexdigest(), bytes=len(raw))
    except Exception as exc:
        record.update(status='fetch_failed', error=str(exc))
    manifest.append(record)

old = ROOT.parent / '2026-10-10_causal_likelihoods' / 'sources'
for name in ('fairfield_charman_2025', 'fairfield_charman_2025_supp', 'bp_2017', 'bp_2019', 'api_2021'):
    for suffix in ('.pdf', '.txt'):
        src, dest = old / (name + suffix), OUT / (name + suffix)
        if not dest.exists():
            shutil.copy2(src, dest)
        manifest.append({'id': name + suffix, 'status': 'copied_preserved_source', 'original': str(src),
                         'sha256': hashlib.sha256(dest.read_bytes()).hexdigest(), 'bytes': dest.stat().st_size})
(OUT / 'manifest.json').write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
print(json.dumps([{'id': x['id'], 'status': x['status'], 'bytes': x.get('bytes'), 'error': x.get('error')} for x in manifest], ensure_ascii=False, indent=2))
