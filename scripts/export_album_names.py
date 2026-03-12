#!/usr/bin/env python3
"""
Export album name suggestions from album_name.mdb (Access) to JSON.
Mines the fan submissions from the "Be a hero. Help name Honchie's debut album" feature.

Exports: id, name, album_name, explanation, email, timestamp

Requires one of:
  - mdbtools: brew install mdbtools
  - mdbread: pip install mdbread
  - pandas_access: pip install pandas_access pandas
  - pyodbc (Windows only)
"""
import json
import os
import sys
from datetime import datetime

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_DIR = os.path.dirname(SCRIPT_DIR)
DB_PATH = os.path.join(PROJECT_DIR, 'album_name', 'album_name.mdb')
OUT_JSON = os.path.join(PROJECT_DIR, 'data', 'album_names.json')
OUT_JS = os.path.join(PROJECT_DIR, 'data', 'album-names-data.js')


def export_with_mdbread():
    """Use mdbread (pip install mdbread) - pure Python, no mdbtools needed."""
    try:
        import mdbread
    except ImportError:
        return None

    if not os.path.exists(DB_PATH):
        return None

    try:
        with mdbread.MDBReader(DB_PATH) as db:
            table = db.get_table('album_name')
            df = table.to_dataframe()
    except Exception:
        return None

    entries = []
    for _, row in df.iterrows():
        try:
            ts = row.get('timestamp')
            if ts is not None and hasattr(ts, 'isoformat'):
                ts = ts.isoformat()
            elif ts is not None:
                ts = str(ts)
            else:
                ts = ''
            entries.append({
                'id': int(row.get('ID', 0)) if row.get('ID') is not None else 0,
                'name': str(row.get('name', '')) if row.get('name') is not None else '',
                'album_name': str(row.get('album_name', '')) if row.get('album_name') is not None else '',
                'explanation': str(row.get('explanation', '')) if row.get('explanation') is not None else '',
                'email': str(row.get('email', '')) if row.get('email') is not None else '',
                'timestamp': ts
            })
        except (ValueError, TypeError):
            continue
    return entries


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
        df = mdb.read_table(DB_PATH, 'album_name')
    except Exception:
        return False

    entries = []
    for _, row in df.iterrows():
        try:
            ts = row.get('timestamp')
            if pd.notna(ts) and hasattr(ts, 'isoformat'):
                ts = ts.isoformat()
            elif ts is not None:
                ts = str(ts)
            else:
                ts = ''
            entries.append({
                'id': int(row.get('ID', 0)) if pd.notna(row.get('ID')) else 0,
                'name': str(row.get('name', '')) if pd.notna(row.get('name')) else '',
                'album_name': str(row.get('album_name', '')) if pd.notna(row.get('album_name')) else '',
                'explanation': str(row.get('explanation', '')) if pd.notna(row.get('explanation')) else '',
                'email': str(row.get('email', '')) if pd.notna(row.get('email')) else '',
                'timestamp': ts
            })
        except (ValueError, TypeError):
            continue
    return entries


def export_with_mdbtools():
    """Use mdb-export from mdbtools (brew install mdbtools)."""
    import subprocess
    import csv
    from io import StringIO

    if not os.path.exists(DB_PATH):
        return None

    mdb_export = None
    for path in ['/opt/homebrew/bin/mdb-export', '/usr/local/bin/mdb-export']:
        if os.path.isfile(path):
            mdb_export = path
            break
    if not mdb_export:
        mdb_export = __import__('shutil').which('mdb-export')
    if not mdb_export:
        return None

    try:
        result = subprocess.run(
            [mdb_export, DB_PATH, 'album_name'],
            capture_output=True, text=True, timeout=10
        )
        if result.returncode != 0:
            return None

        reader = csv.DictReader(StringIO(result.stdout))
        entries = []
        for row in reader:
            try:
                ts = row.get('timestamp', '')
                entries.append({
                    'id': int(row.get('ID', 0)) if row.get('ID') else 0,
                    'name': str(row.get('name', '')),
                    'album_name': str(row.get('album_name', '')),
                    'explanation': str(row.get('explanation', '')),
                    'email': str(row.get('email', '')),
                    'timestamp': ts
                })
            except (ValueError, KeyError):
                continue
        return entries if entries else None
    except (FileNotFoundError, subprocess.TimeoutExpired):
        return None


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
        cursor.execute("SELECT ID, name, album_name, explanation, email, timestamp FROM album_name")
        rows = cursor.fetchall()
        columns = [d[0].lower() if d[0] == 'ID' else d[0] for d in cursor.description]
        conn.close()

        entries = []
        for row in rows:
            d = dict(zip(columns, row))
            ts = d.get('timestamp')
            if ts is not None and hasattr(ts, 'isoformat'):
                d['timestamp'] = ts.isoformat()
            elif ts is not None:
                d['timestamp'] = str(ts)
            entries.append(d)
        return entries
    except Exception:
        return None


def write_output(entries):
    """Write album names to JSON and JS files."""
    data = {'album_names': entries}
    with open(OUT_JSON, 'w') as f:
        json.dump(data, f, indent=2)
    with open(OUT_JS, 'w') as f:
        f.write('window.ALBUM_NAMES_DATA = ' + json.dumps(data) + ';')
    print(f"Exported {len(entries)} album name suggestions to data/album_names.json and data/album-names-data.js")


if __name__ == '__main__':
    if not os.path.exists(DB_PATH):
        print(f"Database not found: {DB_PATH}")
        sys.exit(1)

    entries = export_with_mdbread()
    if entries is None:
        entries = export_with_pandas_access()
    if entries is False or entries is None:
        entries = export_with_mdbtools()
    if entries is None:
        entries = export_with_pyodbc()

    if entries:
        write_output(entries)
    else:
        print("Could not read database. Install one of:")
        print("  brew install mdbtools")
        print("  pip install mdbread")
        print("  pip install pandas_access pandas")
        sys.exit(1)
