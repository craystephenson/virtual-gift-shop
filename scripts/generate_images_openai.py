#!/usr/bin/env python3
"""
Generate modern product images using OpenAI DALL-E 3 API.
Reads prompts from prompts/modern/manifest.json and saves to images/full-modern/.

Usage:
  1. Install: pip install openai
  2. Set your API key: export OPENAI_API_KEY=sk-...
  3. Run: python3 scripts/generate_images_openai.py

Options:
  --limit N     Only generate first N products (for testing)
  --skip N      Skip first N products (resume after failure)
  --dry-run     Print what would be generated, don't call API
"""

import argparse
import base64
import json
import os
import time

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_DIR = os.path.dirname(SCRIPT_DIR)
MANIFEST = os.path.join(PROJECT_DIR, 'prompts', 'modern', 'manifest.json')
OUTPUT_DIR = os.path.join(PROJECT_DIR, 'images', 'full-modern')

# DALL-E 3 prompt limit is 4000 chars; we truncate if needed
MAX_PROMPT_LEN = 4000


def build_prompt(product):
    """Build the full prompt from base + product context."""
    base = """Reimagine this as a modern, professionally photographed product advertisement.
Keep the exact same product concept, name, and visual idea, but transform it into a high-end contemporary product photo.
The product should look real, well-designed, and commercially produced.
Maintain the original joke and concept, but redesign the packaging and composition so it looks like a modern retail product.
Style: professional studio product photography, modern packaging, clean typography, realistic lighting, sharp focus.
Composition: SQUARE FORMAT - product centered and composed to fill a square frame. No portrait or landscape orientation. The image is square (1:1 aspect ratio). Product hero shot filling the square, in color, minimal white/gradient background, advertising-quality lighting.

PRODUCT: """
    ctx = f"{product['name']}\n\n{product['description']}"
    full = base + ctx
    if len(full) > MAX_PROMPT_LEN:
        full = full[:MAX_PROMPT_LEN - 20] + "..."
    return full


def main():
    parser = argparse.ArgumentParser(description='Generate product images via OpenAI DALL-E 3')
    parser.add_argument('--limit', type=int, default=0, help='Only generate first N products')
    parser.add_argument('--skip', type=int, default=0, help='Skip first N products')
    parser.add_argument('--dry-run', action='store_true', help='Print prompts only, no API calls')
    args = parser.parse_args()

    with open(MANIFEST) as f:
        manifest = json.load(f)

    products = manifest['products']
    if args.skip:
        products = products[args.skip:]
    if args.limit:
        products = products[:args.limit]

    api_key = os.environ.get('OPENAI_API_KEY')
    if not api_key and not args.dry_run:
        print('Error: Set OPENAI_API_KEY environment variable.')
        print('  export OPENAI_API_KEY=sk-your-key-here')
        return 1

    os.makedirs(OUTPUT_DIR, exist_ok=True)

    try:
        from openai import OpenAI
    except ImportError:
        print('Error: Install the OpenAI package: pip install openai')
        return 1

    client = OpenAI(api_key=api_key) if api_key else None

    ok, fail = 0, 0
    for i, p in enumerate(products):
        out_file = p['output_file']
        dest = os.path.join(OUTPUT_DIR, out_file)
        if os.path.exists(dest) and os.path.getsize(dest) > 1000:
            print(f'Skip (exists): {out_file}')
            ok += 1
            continue

        prompt = build_prompt(p)
        print(f'\n[{i+1}/{len(products)}] {p["name"]} -> {out_file}')

        if args.dry_run:
            print(f'  Prompt length: {len(prompt)} chars')
            continue

        try:
            response = client.images.generate(
                model='dall-e-3',
                prompt=prompt,
                size='1024x1024',
                quality='standard',
                n=1,
                response_format='b64_json',
            )
            b64 = response.data[0].b64_json
            img_data = base64.b64decode(b64)
            from PIL import Image
            import io
            img = Image.open(io.BytesIO(img_data))
            if img.mode in ('RGBA', 'P'):
                img = img.convert('RGB')
            # Resize to 800x800 for consistent layout (manifest dimensions)
            if img.size != (800, 800):
                img = img.resize((800, 800), Image.Resampling.LANCZOS)
            base, ext = os.path.splitext(out_file)
            if ext.lower() in ('.jpg', '.jpeg'):
                img.save(dest, 'JPEG', quality=90)
            else:
                img.save(dest, 'PNG')
            print(f'  OK: {out_file}')
            ok += 1
        except Exception as e:
            print(f'  Fail: {e}')
            fail += 1

        time.sleep(1)  # Rate limit

    if not args.dry_run:
        print(f'\nDone: {ok} ok, {fail} failed')
    return 0 if fail == 0 else 1


if __name__ == '__main__':
    exit(main())
