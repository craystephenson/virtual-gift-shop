(function() {
  const STORAGE_KEY = 'honchie-theme';

  function getModernCssPath() {
    const base = document.querySelector('link[href*="shop.css"]');
    if (base && base.href) {
      return base.href.replace('shop.css', 'shop-modern.css');
    }
    return 'css/shop-modern.css';
  }

  function loadModernCss() {
    if (document.getElementById('theme-modern-css')) return;
    const link = document.createElement('link');
    link.rel = 'stylesheet';
    link.href = getModernCssPath();
    link.id = 'theme-modern-css';
    document.head.appendChild(link);
  }

  function isModern() {
    return document.body.classList.contains('theme-modern');
  }

  function setTheme(modern) {
    if (modern) {
      document.body.classList.add('theme-modern');
      localStorage.setItem(STORAGE_KEY, 'modern');
    } else {
      document.body.classList.remove('theme-modern');
      localStorage.setItem(STORAGE_KEY, 'classic');
    }
    updateButton();
    updateLogos(modern);
    updateTagline(modern);
    document.dispatchEvent(new CustomEvent('themeChanged', { detail: { modern: modern } }));
    if (window.HonchieProducts && typeof window.HonchieProducts.updateImagesForTheme === 'function') {
      window.HonchieProducts.updateImagesForTheme();
    }
  }

  function updateLogos(modern) {
    var target = modern ? 'honchie-modern.png' : 'honchie.gif';
    document.querySelectorAll('a[href*="index.html"] img[src*="honchie"]').forEach(function(img) {
      img.src = img.src.replace(/honchie(-modern)?\.(gif|png)/, target);
    });
  }

  function updateTagline(modern) {
    var existing = document.querySelector('.honchie-tagline');
    if (existing) existing.remove();
    if (!modern) return;
    var logoLink = document.querySelector('table[border="0"]:first-of-type td a[href*="index.html"]');
    if (!logoLink || !logoLink.parentNode) return;
    var tagline = document.createElement('span');
    tagline.className = 'honchie-tagline';
    tagline.innerHTML = '<em>Random music</em> A gift shop for discriminating tastes';
    logoLink.parentNode.appendChild(tagline);
  }

  function updateButton() {
    const btn = document.getElementById('theme-toggle-btn');
    if (btn) {
      btn.textContent = isModern() ? 'Classic' : 'Modern';
    }
  }

  function createButton() {
    if (document.getElementById('theme-toggle-btn')) return;
    loadModernCss();
    const btn = document.createElement('button');
    btn.id = 'theme-toggle-btn';
    btn.className = 'theme-toggle';
    btn.textContent = isModern() ? 'Classic' : 'Modern';
    btn.setAttribute('aria-label', 'Toggle theme');
    btn.onclick = function() {
      setTheme(!isModern());
    };
    document.body.appendChild(btn);
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }

  function init() {
    var modern = localStorage.getItem(STORAGE_KEY) !== 'classic';
    if (modern) {
      loadModernCss();
      document.body.classList.add('theme-modern');
    }
    createButton();
    updateLogos(modern);
    updateTagline(modern);
  }
})();
