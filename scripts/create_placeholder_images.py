#!/usr/bin/env python3
"""
Create placeholder images for products whose image files are missing.
Generates 200x200 PNG images with product name for use in the gift shop.
"""
import json
import os
import re
from PIL import Image, ImageDraw, ImageFont

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_DIR = os.path.dirname(SCRIPT_DIR)
DATA_JS = os.path.join(PROJECT_DIR, 'data', 'products-data.js')

def main():
    with open(DATA_JS, 'r') as f:
        content = f.read()
    match = re.search(r'window\.PRODUCTS_DATA\s*=\s*(\{.*?\});?\s*$', content, re.DOTALL)
    if not match:
        print('Could not parse products-data.js')
        return
    data = json.loads(match.group(1))
    products = data.get('products', [])

    created = 0
    for p in products:
        name = p.get('name', 'Product')
        for key in ('thumbnails', 'image'):
            val = str(p.get(key, '')).replace('#', '').strip()
            if not val.startswith('images/'):
                continue
            # val is like images/full/butcherkit.jpg or images/thumb/paper.jpg
            parts = val.split('/')
            if len(parts) != 3:
                continue
            folder, fname = parts[1], parts[2]
            dest_dir = os.path.join(PROJECT_DIR, 'images', folder)
            dest_path = os.path.join(dest_dir, fname)
            if os.path.exists(dest_path) and os.path.getsize(dest_path) > 500:
                continue
            os.makedirs(dest_dir, exist_ok=True)
            # Create 200x200 placeholder
            img = Image.new('RGB', (200, 200), color=(248, 248, 248))
            draw = ImageDraw.Draw(img)
            # Try to use a font; fall back to default
            try:
                font = ImageFont.truetype('/System/Library/Fonts/Helvetica.ttc', 14)
            except Exception:
                font = ImageFont.load_default()
            # Word-wrap the name (max ~25 chars per line)
            words = name.replace('\n', ' ').split()
            lines = []
            current = ''
            for w in words:
                if len(current) + len(w) + 1 <= 22:
                    current = (current + ' ' + w).strip() if current else w
                else:
                    if current:
                        lines.append(current)
                    current = w
            if current:
                lines.append(current)
            lines = lines[:4]  # max 4 lines
            y = 80
            for line in lines:
                # Center text (approx)
                bbox = draw.textbbox((0, 0), line, font=font)
                w = bbox[2] - bbox[0]
                x = (200 - w) // 2
                draw.text((x, y), line, fill=(100, 100, 100), font=font)
                y += 22
            # Border
            draw.rectangle([(2, 2), (197, 197)], outline=(200, 200, 200), width=1)
            # Save as PNG (browsers handle PNG regardless of extension)
            base, ext = os.path.splitext(fname)
            png_fname = base + '.png'
            png_path = os.path.join(dest_dir, png_fname)
            img.save(png_path, 'PNG')
            p[key] = f'images/{folder}/{png_fname}'
            print(f'Created: {fname} ({name[:40]}...)')
            created += 1

    if created > 0:
        new_js = 'window.PRODUCTS_DATA = ' + json.dumps(data) + ';\n'
        with open(DATA_JS, 'w') as f:
            f.write(new_js)
        print(f'\nCreated {created} placeholder images. Updated products-data.js.')
    else:
        print('No missing images to create.')

if __name__ == '__main__':
    main()
