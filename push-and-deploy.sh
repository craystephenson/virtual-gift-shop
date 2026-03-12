#!/bin/bash
# Honchie Virtual Gift Shop - Push to GitHub & Deploy to Cloudflare

set -e

echo "=== Step 1: Push to GitHub ==="
# Add remote if not already added
if ! git remote get-url origin 2>/dev/null; then
  git remote add origin https://github.com/craystephenson/virtual-gift-shop.git
fi

# Push (repo must exist - create at https://github.com/new first if needed)
git push -u origin main 2>/dev/null || {
  echo ""
  echo "Push failed. Create the repo first:"
  echo "  1. Open https://github.com/new"
  echo "  2. Name: virtual-gift-shop"
  echo "  3. Public, no README"
  echo "  4. Create, then run this script again"
  exit 1
}

echo ""
echo "=== Step 2: Deploy to Cloudflare Pages ==="
echo "Logging in to Cloudflare (opens browser)..."
npx wrangler login

echo ""
echo "Creating project if needed..."
npx wrangler pages project create honchie-gift-shop 2>/dev/null || true

echo ""
echo "Deploying..."
npx wrangler pages deploy . --project-name=honchie-gift-shop

echo ""
echo "Done! Your site should be live at https://honchie-gift-shop.pages.dev"
