#!/usr/bin/env python3
"""
Generate AI prompts for modern Sell Out product images.
Outputs prompts to prompts/modern/ for use with image generation APIs.
Each product gets a prompt = BASE_PROMPT + product name + description.
Images: 800x800px (detail), square format for consistent layout.
"""
import json
import os
import re

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_DIR = os.path.dirname(SCRIPT_DIR)
DATA_JS = os.path.join(PROJECT_DIR, 'data', 'products-data.js')
OUTPUT_DIR = os.path.join(PROJECT_DIR, 'prompts', 'modern')

BASE_PROMPT = """Reimagine this image as a modern, professionally photographed product advertisement.
Keep the exact same product concept, name, and visual idea, but transform it into a high-end contemporary product photo.
The product should look real, well-designed, and commercially produced, not like a crude Photoshop collage.
Maintain the original joke and concept, but redesign the packaging and composition so it looks like a modern retail product from today.
Style:
• professional studio product photography
• modern packaging design
• clean typography
• realistic lighting and shadows
• sharp focus
• premium materials and printing
• subtle reflections and depth
Composition:
• SQUARE FORMAT (1:1) - product centered and composed to fill the square frame
• No portrait or landscape orientation; the image must be square
• centered product hero shot filling the square
• Must be in color
• minimal studio background (white, gradient, or soft color)
• advertising-quality lighting
• cinematic product styling
Important:
Do not change the product idea, characters, or humor.
Only upgrade the design, realism, lighting, and photography to look like a modern commercial product launch.

PRODUCT CONTEXT:
"""

DIMENSIONS_NOTE = "\n\n[CRITICAL: Generate as square image, 800x800 pixels. Product must fill the square frame - no portrait/landscape composition.]"


def get_image_basename(val):
    if not val:
        return None
    s = str(val).replace('#', '').strip()
    if s.startswith('http://') or s.startswith('https://'):
        return s.split('/')[-1]
    if s.startswith('images/'):
        return s.split('/')[-1]
    return s


def main():
    with open(DATA_JS, 'r') as f:
        content = f.read()
    match = re.search(r'window\.PRODUCTS_DATA\s*=\s*(\{.*?\});?\s*$', content, re.DOTALL)
    if not match:
        print('Could not parse products-data.js')
        return
    data = json.loads(match.group(1))
    products = data.get('products', [])

    os.makedirs(OUTPUT_DIR, exist_ok=True)

    prompts = []
    for p in products:
        name = p.get('name', 'Product')
        desc = (p.get('description') or '').replace('\n', ' ').strip()[:500]
        img_val = p.get('image') or p.get('thumbnails') or ''
        fname = get_image_basename(img_val)
        if not fname:
            continue
        base, ext = os.path.splitext(fname)
        out_fname = base + '.jpg'

        full_prompt = BASE_PROMPT + f"Name: {name}\n\nDescription: {desc}" + DIMENSIONS_NOTE

        prompts.append({
            'id': p.get('id'),
            'name': name,
            'description': (p.get('description') or '').strip(),
            'output_file': out_fname,
            'prompt': full_prompt,
        })

        with open(os.path.join(OUTPUT_DIR, f'{p["id"]:03d}_{base}.txt'), 'w') as f:
            f.write(full_prompt)

    manifest = {
        'base_prompt': BASE_PROMPT,
        'dimensions': '800x800',
        'output_dir': 'images/full-modern/',
        'products': [{'id': x['id'], 'name': x['name'], 'description': x['description'], 'output_file': x['output_file']} for x in prompts],
    }
    with open(os.path.join(OUTPUT_DIR, 'manifest.json'), 'w') as f:
        json.dump(manifest, f, indent=2)

    print(f'Generated {len(prompts)} prompts in {OUTPUT_DIR}/')
    print(f'Manifest: prompts/modern/manifest.json')
    print('\nTo generate images, use each .txt file with your preferred AI image API.')
    print('Save outputs to images/full-modern/ with the filename from manifest.')


if __name__ == '__main__':
    main()
