#!/usr/bin/env python3
"""
Remove white rectangle from honchie-modern.png by cropping to content.
Finds bounding box of non-white pixels and crops, then makes remaining
edge white transparent.
"""
from PIL import Image
import os

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_DIR = os.path.dirname(SCRIPT_DIR)
SRC = os.path.join(PROJECT_DIR, 'images', 'storefront', 'honchie-modern.png')
OUT = SRC

def main():
    img = Image.open(SRC).convert('RGBA')
    data = img.load()
    w, h = img.size
    threshold = 250  # pixels with r,g,b >= this are "background"

    # Find bounding box of non-background (content) pixels
    x_min, y_min = w, h
    x_max, y_max = 0, 0
    for y in range(h):
        for x in range(w):
            r, g, b, a = data[x, y]
            if a < 128 or r < threshold or g < threshold or b < threshold:
                x_min = min(x_min, x)
                y_min = min(y_min, y)
                x_max = max(x_max, x)
                y_max = max(y_max, y)

    if x_max < x_min or y_max < y_min:
        print('No content found')
        return

    # Add small padding
    pad = 2
    x_min = max(0, x_min - pad)
    y_min = max(0, y_min - pad)
    x_max = min(w + 1, x_max + pad + 1)
    y_max = min(h + 1, y_max + pad + 1)

    # Crop to content
    cropped = img.crop((x_min, y_min, x_max, y_max))
    cropped.save(OUT, 'PNG')
    print(f'Cropped to {x_max - x_min}x{y_max - y_min}, removed white margins.')

if __name__ == '__main__':
    main()
