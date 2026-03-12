(function() {
  // Category priority: first match wins so each product appears in only one category
  // Entertainment BEFORE Home so "Home Entertainment" goes to Entertainment
  const categoryOrder = [
    ['entertainment', /\bentertainment\b/i],          // Entertainment, Home Entertainment
    ['home_office', /\bhome\b|\boffice\b/i],          // Home, Home & Office (excludes Home Entertainment)
    ['food_drink', /\bfood\b|\bdrink\b/i],
    ['health_beauty', /\bhealth\b|\bbeauty\b/i],
    ['apparel', /\bapparel\b/i],
    ['services', /\bservices\b/i],
    ['music', /\bmusic\b/i]
  ];
  const validCategories = new Set(categoryOrder.map(([cat]) => cat));

  function getCategoryFromPage() {
    const path = window.location.pathname || '';
    const match = path.match(/\/([^\/]+)\.html$/);
    if (match) return match[1];
    return document.body.getAttribute('data-category') || '';
  }

  function getProductCategory(product) {
    const cat = (product.category || '');
    for (const [pageCat, regex] of categoryOrder) {
      if (regex.test(cat)) return pageCat;
    }
    return null;
  }

  function matchesCategory(product, pageCategory) {
    return getProductCategory(product) === pageCategory;
  }

  function getBasePath() {
    const path = window.location.pathname || '';
    return path.indexOf('/categories/') >= 0 || path.indexOf('\\categories\\') >= 0 ? '../' : '';
  }

  function isSellOutTheme() {
    return typeof localStorage !== 'undefined' && localStorage.getItem('honchie-theme') === 'modern';
  }

  // Thumb and full use different filenames for some products - map thumb name to full name
  var THUMB_TO_FULL_FILENAME = {
    'joe.jpeg': 'joe.jpg',
    'imonkey.jpg': 'imonk.jpg',
    'fecal.jpg': 'fecalmist.jpg',
    'thumb3.jpg': '3.jpg',
    'condom2th.jpg': 'condom2.jpg',
    'thumbmrt.jpg': 'mrt.jpg'
  };

  function getImageUrl(val, useFull) {
    if (!val) return null;
    var s = String(val).replace(/^#+|#+$/g, '').trim();
    if (s.startsWith('http://') || s.startsWith('https://')) return s;
    var base = getBasePath();
    var folder = useFull ? 'full' : 'thumb';
    var path = s.startsWith('images/') ? s : 'images/' + folder + '/' + s;
    var parts = path.split('/');
    var fname = parts[parts.length - 1];
    if (isSellOutTheme()) {
      fname = THUMB_TO_FULL_FILENAME[fname] || fname;
      path = 'images/full-modern/' + fname;
    } else if (useFull && THUMB_TO_FULL_FILENAME[fname]) {
      path = path.replace('/thumb/', '/full/').replace(fname, THUMB_TO_FULL_FILENAME[fname]);
    }
    return base + path;
  }

  function getImageFallback(val, useFull) {
    if (!val) return null;
    var s = String(val).replace(/^#+|#+$/g, '').trim();
    if (s.startsWith('http://') || s.startsWith('https://')) return null;
    var base = getBasePath();
    var folder = useFull ? 'full' : 'thumb';
    var path = s.startsWith('images/') ? s : 'images/' + folder + '/' + s;
    // When useFull, always return full path (product detail page) - never thumb
    if (useFull && path.indexOf('/thumb/') >= 0) {
      var f = path.split('/').pop();
      var fullFname = THUMB_TO_FULL_FILENAME[f] || f;
      path = path.replace('/thumb/', '/full/').replace(f, fullFname);
    }
    return base + path;
  }

  function formatPrice(price) {
    if (price == null || price === '') return '$0.00';
    var n = Number(price);
    return '$' + (isNaN(n) ? '0.00' : n.toFixed(2));
  }

  function renderProduct(product) {
    const base = getBasePath();
    const imgVal = product.thumbnails || product.image;
    const imgSrc = getImageUrl(imgVal, false) || base + 'images/storefront/placeholder.gif';
    // In Modern theme, fall back to full classic (not thumb) when full-modern fails
    const fallback = isSellOutTheme() ? (getImageFallback(imgVal, true) || getImageFallback(imgVal, false) || base + 'images/storefront/placeholder.gif') : base + 'images/storefront/placeholder.gif';
    const productHref = base + 'product.html?id=' + product.id;
    return `
      <div class="product-card">
        <a href="${productHref}" class="product-link">
          <div class="product-image">
            <img src="${imgSrc}" alt="${product.name}" data-fallback="${fallback}" onerror="if(this.dataset.fallback)this.src=this.dataset.fallback">
          </div>
          <div class="product-info">
            <h3 class="product-name">${product.name}</h3>
            <p class="product-description">${product.description || ''}</p>
            <p class="product-price">${formatPrice(product.price)}</p>
            <span class="product-cta">View details</span>
          </div>
        </a>
      </div>
    `;
  }

  function renderProducts(products, containerId) {
    const container = document.getElementById(containerId || 'product-grid');
    if (!container) return;
    if (!products.length) {
      container.innerHTML = '<p class="no-products">No products in this category.</p>';
      return;
    }
    container.innerHTML = products.map(renderProduct).join('');
  }

  window.HonchieProducts = {
    getImageUrl: getImageUrl,
    getImageFallback: getImageFallback,
    isSellOutTheme: isSellOutTheme,
    load: function(containerId) {
      const pageCategory = getCategoryFromPage();
      const data = window.PRODUCTS_DATA || { products: [] };
      const products = pageCategory && validCategories.has(pageCategory)
        ? data.products.filter(p => matchesCategory(p, pageCategory))
        : data.products;
      renderProducts(products, containerId);
    },
    updateImagesForTheme: function() {
      if (!window.PRODUCTS_DATA) return;
      if (window.location.pathname.indexOf('search.html') >= 0 || window.location.pathname.indexOf('product.html') >= 0) {
        window.location.reload();
        return;
      }
      var grid = document.getElementById('product-grid');
      if (grid) HonchieProducts.load('product-grid');
    }
  };
})();
