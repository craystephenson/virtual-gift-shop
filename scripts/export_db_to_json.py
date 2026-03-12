#!/usr/bin/env python3
"""
Export products from inventory.mdb (Access) to products.json.
Pulls existing copy, descriptions, and pricing from the database.

Exports: id, category, name, thumbnails, price, image, description

Requires one of:
  - mdbtools: brew install mdbtools
  - mdbread: pip install mdbread
  - pyodbc (Windows only)
"""
import json
import os
import sys

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_DIR = os.path.dirname(SCRIPT_DIR)
DB_PATH = os.path.join(PROJECT_DIR, 'databases', 'inventory.mdb')
OUT_JSON = os.path.join(PROJECT_DIR, 'data', 'products.json')
OUT_JS = os.path.join(PROJECT_DIR, 'data', 'products-data.js')


def export_with_pandas_access():
    """Use pandas_access (pip install pandas_access pandas) - requires mdbtools."""
    try:
        import pandas_access as mdb
        import pandas as pd
    except ImportError:
        return False

    if not os.path.exists(DB_PATH):
        return False

    try:
        df = mdb.read_table(DB_PATH, 'products')
    except Exception:
        return False

    products = []
    for _, row in df.iterrows():
        try:
            products.append({
                'id': int(row.get('id', 0)) if pd.notna(row.get('id')) else 0,
                'category': str(row.get('category', '')) if pd.notna(row.get('category')) else '',
                'name': str(row.get('name', '')) if pd.notna(row.get('name')) else '',
                'thumbnails': str(row.get('thumbnails', '')) if pd.notna(row.get('thumbnails')) else '',
                'price': float(row.get('price', 0)) if pd.notna(row.get('price')) else 0,
                'image': str(row.get('image', '')) if pd.notna(row.get('image')) else '',
                'description': str(row.get('description', '')) if pd.notna(row.get('description')) else ''
            })
        except (ValueError, TypeError):
            continue
    return products


def export_with_mdbtools():
    """Use mdb-export from mdbtools (brew install mdbtools)."""
    import subprocess
    import csv
    from io import StringIO

    if not os.path.exists(DB_PATH):
        return None

    # Try common paths for mdb-export
    mdb_export = 'mdb-export'
    for path in ['/opt/homebrew/bin/mdb-export', '/usr/local/bin/mdb-export']:
        if os.path.isfile(path):
            mdb_export = path
            break

    result = subprocess.run(
        [mdb_export, DB_PATH, 'products'],
        capture_output=True, text=True, timeout=10
    )
    if result.returncode != 0:
        return None

    reader = csv.DictReader(StringIO(result.stdout))
    products = []
    for i, row in enumerate(reader):
        try:
            products.append({
                'id': int(row.get('id', i + 1)) if row.get('id') else i + 1,
                'category': str(row.get('category', '')),
                'name': str(row.get('name', '')),
                'thumbnails': str(row.get('thumbnails', '')),
                'price': float(row.get('price', 0)) if row.get('price') else 0,
                'image': str(row.get('image', '')),
                'description': str(row.get('description', '')) if row.get('description') else ''
            })
        except (ValueError, KeyError):
            continue
    return products if products else None


def export_with_pyodbc():
    """Use pyodbc (Windows only, requires Access drivers)."""
    try:
        import pyodbc
    except ImportError:
        return None

    if not os.path.exists(DB_PATH):
        return None

    try:
        conn_str = f"DRIVER={{Microsoft Access Driver (*.mdb)}};DBQ={os.path.abspath(DB_PATH)}"
        conn = pyodbc.connect(conn_str)
        cursor = conn.cursor()
        cursor.execute("SELECT id, category, name, thumbnails, price, image, description FROM products")
        rows = cursor.fetchall()
        columns = [d[0] for d in cursor.description]
        conn.close()

        products = []
        for row in rows:
            products.append(dict(zip(columns, [str(v) if v is not None else '' for v in row])))
        return products
    except Exception:
        return None


def write_output(products):
    """Write products to JSON and JS files."""
    data = {'products': products}
    with open(OUT_JSON, 'w') as f:
        json.dump(data, f, indent=2)
    with open(OUT_JS, 'w') as f:
        f.write('window.PRODUCTS_DATA = ' + json.dumps(data) + ';')
    print(f"Exported {len(products)} products to data/products.json and data/products-data.js")


if __name__ == '__main__':
    if not os.path.exists(DB_PATH):
        print(f"Database not found: {DB_PATH}")
        print("Place inventory.mdb in the databases/ folder.")
        sys.exit(1)

    products = export_with_pandas_access()
    if products is False or products is None:
        products = export_with_mdbtools()
    if products is None:
        products = export_with_pyodbc()

    if products:
        write_output(products)
    else:
        print("Could not read database. Install one of:")
        print("  brew install mdbtools")
        print("  pip install mdbread")
        sys.exit(1)
