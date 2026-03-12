#!/usr/bin/env python3
"""
Download product images from 64.21.25.39 to local images/thumb and images/full.
Updates products-data.js to use local paths. Run from project root.
"""
import json
import os
import re
import urllib.request
import urllib.error

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_DIR = os.path.dirname(SCRIPT_DIR)
DATA_JS = os.path.join(PROJECT_DIR, 'data', 'products-data.js')
THUMB_DIR = os.path.join(PROJECT_DIR, 'images', 'thumb')
FULL_DIR = os.path.join(PROJECT_DIR, 'images', 'full')

def extract_url(s):
    if not s:
        return None
    s = str(s).replace('#', '').strip()
    if s.startswith('http://') or s.startswith('https://'):
        return s
    return None

def filename_from_url(url):
    return url.split('/')[-1]

def main():
    os.makedirs(THUMB_DIR, exist_ok=True)
    os.makedirs(FULL_DIR, exist_ok=True)

    with open(DATA_JS, 'r') as f:
        content = f.read()
    match = re.search(r'window\.PRODUCTS_DATA\s*=\s*(\{.*?\});?\s*$', content, re.DOTALL)
    if not match:
        print('Could not parse products-data.js')
        return
    data = json.loads(match.group(1))
    products = data.get('products', [])

    count = 0
    for p in products:
        for key in ('thumbnails', 'image'):
            url = extract_url(p.get(key))
            if not url or '64.21.25.39' not in url:
                continue
            folder = 'thumb' if key == 'thumbnails' else 'full'
            dest_dir = THUMB_DIR if key == 'thumbnails' else FULL_DIR
            fname = filename_from_url(url)
            dest_path = os.path.join(dest_dir, fname)
            if not os.path.exists(dest_path):
                try:
                    req = urllib.request.Request(url, headers={'User-Agent': 'Honchie/1.0'})
                    with urllib.request.urlopen(req, timeout=10) as resp:
                        with open(dest_path, 'wb') as out:
                            out.write(resp.read())
                    print(f'Downloaded: {fname}')
                except (urllib.error.URLError, OSError) as e:
                    print(f'Failed {url}: {e}')
                    continue
            p[key] = f'images/{folder}/{fname}'
            count += 1

    new_js = 'window.PRODUCTS_DATA = ' + json.dumps(data, indent=0) + ';\n'
    with open(DATA_JS, 'w') as f:
        f.write(new_js)
    print(f'Updated {count} image paths in products-data.js')

if __name__ == '__main__':
    main()
