#!/usr/bin/env python3
"""
Update products-data.js to use local image paths.
Uses images in images/full/ and images/thumb/ (falls back to full if thumb missing).
Includes filename mappings for known DB-to-file mismatches.
"""
import json
import os
import re

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_DIR = os.path.dirname(SCRIPT_DIR)
DATA_JS = os.path.join(PROJECT_DIR, 'data', 'products-data.js')
FULL_DIR = os.path.join(PROJECT_DIR, 'images', 'full')
THUMB_DIR = os.path.join(PROJECT_DIR, 'images', 'thumb')

# DB filename -> actual local filename (when different)
FILENAME_MAP = {
    'joe.jpeg': 'joe.jpg',
    'imonkey.jpg': 'imonk.jpg',
    'fecal.jpg': 'fecalmist.jpg',  # thumb uses fecal, full uses fecalmist
    '3.jpg': 'thumb3.jpg',  # Dale Earnheart - 3.jpg not in archive, thumb3 exists
}

def extract_url(s):
    if not s:
        return None
    s = str(s).replace('#', '').strip()
    if s.startswith('http://') or s.startswith('https://'):
        return s
    return None

def filename_from_url(url):
    return url.split('/')[-1]

def resolve_local(fname, full_files, thumb_files, want_thumb):
    """Return local path if file exists, else None."""
    actual = FILENAME_MAP.get(fname, fname)
    if want_thumb and actual in thumb_files:
        return f'images/thumb/{actual}'
    if actual in full_files:
        return f'images/full/{actual}'
    return None

def main():
    with open(DATA_JS, 'r') as f:
        content = f.read()
    match = re.search(r'window\.PRODUCTS_DATA\s*=\s*(\{.*?\});?\s*$', content, re.DOTALL)
    if not match:
        print('Could not parse products-data.js')
        return
    data = json.loads(match.group(1))
    products = data.get('products', [])
    full_files = set(os.listdir(FULL_DIR)) if os.path.isdir(FULL_DIR) else set()
    thumb_files = set(os.listdir(THUMB_DIR)) if os.path.isdir(THUMB_DIR) else set()

    count = 0
    for p in products:
        for key in ('thumbnails', 'image'):
            url = extract_url(p.get(key))
            if not url:
                continue
            fname = filename_from_url(url)
            want_thumb = (key == 'thumbnails')
            local = resolve_local(fname, full_files, thumb_files, want_thumb)
            if local:
                p[key] = local
                count += 1
        # If thumb still remote but image is local, use image for thumb (cards show thumb)
        t = str(p.get('thumbnails', '')).replace('#', '').strip()
        if (t.startswith('http://') or t.startswith('https://')) and p.get('image', '').startswith('images/'):
            p['thumbnails'] = p['image']
            count += 1
        # If image still remote but thumb is local, use thumb for image (e.g. bigpaper.jpg missing, paper.jpg exists)
        i = str(p.get('image', '')).replace('#', '').strip()
        if (i.startswith('http://') or i.startswith('https://')) and p.get('thumbnails', '').startswith('images/'):
            p['image'] = p['thumbnails']
            count += 1

    new_js = 'window.PRODUCTS_DATA = ' + json.dumps(data) + ';\n'
    with open(DATA_JS, 'w') as f:
        f.write(new_js)
    print(f'Updated {count} image paths to use local files.')

if __name__ == '__main__':
    main()
