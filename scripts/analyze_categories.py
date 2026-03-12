#!/usr/bin/env python3
"""
Analyze products.json - show which products belong in Home & Office vs Entertainment.
Run: python3 scripts/analyze_categories.py
"""
import json
import os

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PRODUCTS_PATH = os.path.join(SCRIPT_DIR, '..', 'data', 'products.json')

with open(PRODUCTS_PATH) as f:
    data = json.load(f)

products = data.get('products', [])

# Category mapping (same as products.js)
category_order = [
    ('entertainment', 'entertainment'),
    ('home_office', 'home|office'),
    ('food_drink', 'food|drink'),
    ('health_beauty', 'health|beauty'),
    ('apparel', 'apparel'),
    ('services', 'services'),
    ('music', 'music'),
]

import re
def get_category(product):
    cat = (product.get('category') or '').lower()
    for page_cat, pattern in category_order:
        if re.search(r'\b(' + pattern + r')\b', cat):
            return page_cat
    return None

home_office = []
entertainment = []
other = []
uncategorized = []

for p in products:
    page_cat = get_category(p)
    if page_cat == 'home_office':
        home_office.append(p)
    elif page_cat == 'entertainment':
        entertainment.append(p)
    elif page_cat:
        other.append((page_cat, p))
    else:
        uncategorized.append(p)

print("=" * 60)
print("HOME & OFFICE (category contains 'home' or 'office'):")
print("=" * 60)
for p in home_office:
    print(f"  - {p['name']} (category: \"{p.get('category', '')}\")")

print("\n" + "=" * 60)
print("ENTERTAINMENT (category contains 'entertainment'):")
print("=" * 60)
for p in entertainment:
    print(f"  - {p['name']} (category: \"{p.get('category', '')}\")")

if other:
    print("\n" + "=" * 60)
    print("OTHER CATEGORIES:")
    print("=" * 60)
    for cat, p in other:
        print(f"  [{cat}] {p['name']} (category: \"{p.get('category', '')}\")")

if uncategorized:
    print("\n" + "=" * 60)
    print("UNCATEGORIZED (no matching category):")
    print("=" * 60)
    for p in uncategorized:
        print(f"  - {p['name']} (category: \"{p.get('category', '')}\")")

print("\n" + "=" * 60)
print("UNIQUE CATEGORY VALUES IN DATABASE:")
print("=" * 60)
categories = set(p.get('category', '') for p in products)
for c in sorted(categories):
    count = sum(1 for p in products if p.get('category') == c)
    print(f"  \"{c}\": {count} product(s)")
