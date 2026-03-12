# Deploy Honchie Virtual Gift Shop

## Step 1: Create the GitHub repo (one-time)

1. Go to **https://github.com/new**
2. Repository name: `virtual-gift-shop` (or any name you prefer)
3. Choose **Public**
4. **Do NOT** add a README, .gitignore, or license (we already have these)
5. Click **Create repository**

## Step 2: Push to GitHub

Run these commands (replace `YOUR_USERNAME` with your GitHub username if different from `craystephenson`):

```bash
git remote add origin https://github.com/craystephenson/virtual-gift-shop.git
git branch -M main
git push -u origin main
```

If the repo name or username is different, adjust the URL accordingly.

## Step 3: Deploy to Cloudflare Pages (Direct Upload — no GitHub OAuth)

This method avoids connecting GitHub to Cloudflare. You deploy from your machine.

1. **Install Wrangler** (one-time):
   ```bash
   npm install -g wrangler
   ```

2. **Log in to Cloudflare** (one-time):
   ```bash
   npx wrangler login
   ```
   This opens a browser to authenticate. No GitHub connection needed.

3. **Create the Pages project** (one-time):
   ```bash
   npx wrangler pages project create honchie-gift-shop
   ```

4. **Deploy** (run whenever you want to update):
   ```bash
   npx wrangler pages deploy . --project-name=honchie-gift-shop
   ```

Your site will be live at `https://honchie-gift-shop.pages.dev` (or the URL Cloudflare shows).
