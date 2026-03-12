#!/usr/bin/env python3
"""
Download missing product images from Wayback Machine archive.
Uses: https://web.archive.org/web/20010406220603im_/http://64.21.25.39/...
Runs curl (avoids Python SSL issues).
"""
import json
import os
import re
import subprocess
import time

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_DIR = os.path.dirname(SCRIPT_DIR)
DATA_JS = os.path.join(PROJECT_DIR, 'data', 'products-data.js')
FULL_DIR = os.path.join(PROJECT_DIR, 'images', 'full')
THUMB_DIR = os.path.join(PROJECT_DIR, 'images', 'thumb')
TIMESTAMP = '20010406220603'
BASE = f'https://web.archive.org/web/{TIMESTAMP}im_/http://64.21.25.39'

def main():
    with open(DATA_JS, 'r') as f:
        content = f.read()
    match = re.search(r'window\.PRODUCTS_DATA\s*=\s*(\{.*?\});?\s*$', content, re.DOTALL)
    if not match:
        print('Could not parse products-data.js')
        return
    data = json.loads(match.group(1))
    products = data.get('products', [])

    to_fetch = []
    for p in products:
        for key in ('thumbnails', 'image'):
            val = str(p.get(key, '')).replace('#', '').strip()
            if not val.startswith('http://64.21.25.39'):
                continue
            fname = val.split('/')[-1]
            folder = 'thumb' if key == 'thumbnails' else 'full'
            dest_dir = THUMB_DIR if folder == 'thumb' else FULL_DIR
            dest_path = os.path.join(dest_dir, fname)
            if os.path.exists(dest_path):
                continue
            url = f'{BASE}/images/{folder}/{fname}'
            to_fetch.append((url, dest_path, key, p))

    if not to_fetch:
        print('No missing images to download.')
        return

    ok, fail = 0, 0
    for url, dest_path, key, p in to_fetch:
        os.makedirs(os.path.dirname(dest_path), exist_ok=True)
        result = subprocess.run(
            ['curl', '-s', '-L', '-f', '-A', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)',
             '-o', dest_path, url],
            capture_output=True, timeout=30
        )
        if result.returncode == 0 and os.path.exists(dest_path) and os.path.getsize(dest_path) > 100:
            p[key] = f'images/{"thumb" if "thumb" in dest_path else "full"}/{os.path.basename(dest_path)}'
            print(f'OK: {os.path.basename(dest_path)}')
            ok += 1
        else:
            if os.path.exists(dest_path):
                os.remove(dest_path)
            print(f'Fail: {os.path.basename(dest_path)}')
            fail += 1
        time.sleep(1)  # avoid rate limiting

    new_js = 'window.PRODUCTS_DATA = ' + json.dumps(data) + ';\n'
    with open(DATA_JS, 'w') as f:
        f.write(new_js)
    print(f'\nDownloaded {ok}, failed {fail}. Updated products-data.js.')

if __name__ == '__main__':
    main()
