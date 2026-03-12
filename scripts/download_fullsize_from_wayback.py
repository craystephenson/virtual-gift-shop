#!/usr/bin/env python3
"""
Download full-size images from Wayback for products that only have thumbnails.
Uses products.json for original full URLs, fetches from archive.
"""
import json
import os
import re
import subprocess
import time

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_DIR = os.path.dirname(SCRIPT_DIR)
PRODUCTS_JSON = os.path.join(PROJECT_DIR, 'data', 'products.json')
DATA_JS = os.path.join(PROJECT_DIR, 'data', 'products-data.js')
FULL_DIR = os.path.join(PROJECT_DIR, 'images', 'full')
TIMESTAMP = '20010406220603'
BASE = f'https://web.archive.org/web/{TIMESTAMP}im_/http://64.21.25.39'

def main():
    with open(PRODUCTS_JSON) as f:
        orig = json.load(f)
    with open(DATA_JS) as f:
        content = f.read()
    match = re.search(r'window\.PRODUCTS_DATA\s*=\s*(\{.*?\});?\s*$', content, re.DOTALL)
    if not match:
        print('Could not parse products-data.js')
        return
    data = json.loads(match.group(1))
    products = data.get('products', [])
    orig_by_id = {p['id']: p for p in orig.get('products', [])}

    to_fetch = []
    for p in products:
        orig_p = orig_by_id.get(p['id'])
        if not orig_p:
            continue
        orig_img = str(orig_p.get('image', '')).replace('#', '').strip()
        if not orig_img.startswith('http://64.21.25.39/images/full/'):
            continue
        full_fname = orig_img.split('/')[-1]
        dest_path = os.path.join(FULL_DIR, full_fname)
        # Skip if we already have a proper full-size (>5KB)
        if os.path.exists(dest_path) and os.path.getsize(dest_path) > 5000:
            p['image'] = f'images/full/{full_fname}'
            continue
        url = f'{BASE}/images/full/{full_fname}'
        to_fetch.append((url, dest_path, p, full_fname))

    if not to_fetch:
        print('No full-size images to fetch.')
        return
    ok, fail = 0, 0
    for url, dest_path, p, full_fname in to_fetch:
        os.makedirs(FULL_DIR, exist_ok=True)
        result = subprocess.run(
            ['curl', '-s', '-L', '-f', '-A', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)',
             '-o', dest_path, url],
            capture_output=True, timeout=30
        )
        if result.returncode == 0 and os.path.exists(dest_path) and os.path.getsize(dest_path) > 500:
            p['image'] = f'images/full/{full_fname}'
            print(f'OK: {full_fname}')
            ok += 1
        else:
            if os.path.exists(dest_path):
                os.remove(dest_path)
            print(f'Fail: {full_fname}')
            fail += 1
        time.sleep(1)

    new_js = 'window.PRODUCTS_DATA = ' + json.dumps(data) + ';\n'
    with open(DATA_JS, 'w') as f:
        f.write(new_js)
    print(f'\nFetched {ok} full-size, failed {fail}.')

if __name__ == '__main__':
    main()
