# Modern Sell Out Product Images

AI-generated product images for the **Sell Out** (modern) theme. When users switch to Sell Out mode, the shop uses images from `images/full-modern/` instead of the classic originals.

## Dimensions

- **800×800 pixels** (square) for consistent layout
- Used for both grid thumbnails and detail view

## Workflow

### 1. Generate prompts (already done)

```bash
python3 scripts/generate_modern_prompts.py
```

Creates `prompts/modern/*.txt` — one prompt per product, combining:
- Your base prompt (style, composition, constraints)
- Product name and description for context

### 2. Generate images

#### Option A: OpenAI DALL·E 3 (recommended)

```bash
pip install openai
export OPENAI_API_KEY=sk-your-key-here
python3 scripts/generate_images_openai.py
```

Options:
- `--limit 5` — Generate only first 5 products (for testing)
- `--skip 10` — Skip first 10 (resume after failure)
- `--dry-run` — Show what would run, no API calls

Images are saved to `images/full-modern/` as 1024×1024 PNG. The script skips products that already have images.

#### Option B: Other APIs

Use each `.txt` file with Midjourney, Stable Diffusion, etc. Save outputs to:

```
images/full-modern/{filename}
```

Filenames come from `manifest.json` (e.g. `actioncat.jpg`, `butcherkit.jpg`).

### 3. Fallback behavior

If a modern image is missing, the site automatically falls back to the classic image.

## Sample images

Three sample images are included as proof of concept:
- `actioncat.jpg` — Actioncat 2000
- `bearchair.jpg` — The Bear Chair
- `butcherkit.jpg` — Do-It-Yourself Butcher Kit

## Testing

1. Open any category page (e.g. `categories/home_office.html`)
2. Click the **Sell Out** button (bottom right)
3. Products with modern images will show the new photos; others fall back to classic
