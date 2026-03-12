# Database files

Place your `inventory.mdb` (Microsoft Access) file here.

The inventory database should have a `products` table with columns:
- id
- category
- name
- thumbnails
- price
- image
- description

Then run from the project root:
```
python3 scripts/export_db_to_json.py
```

This exports the product data (including the existing copy/descriptions) to `data/products.json` and `data/products-data.js`.
