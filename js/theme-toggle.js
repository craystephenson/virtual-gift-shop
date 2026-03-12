(function() {
  const STORAGE_KEY = 'honchie-theme';

  var TAGLINES = [
    'A gift shop for the smallest of intellects',
    'A gift shop for monkeys and midgets',
    'A gift shop where it\'s always 1998',
    'A gift shop for the intellectually inferior',
    'A gift shop for peope like Foss and Jeff',
    'A gift shop for discriminating tastes',
    'A gift shop where your knee hurt',
    'A gift shop for the remarkably un-PC'
  ];

  function randomTagline() {
    return TAGLINES[Math.floor(Math.random() * TAGLINES.length)];
  }

  function getCssBase() {
    var segs = location.pathname.split('/').filter(Boolean);
    var d = Math.max(0, segs.length - 1);
    return (d ? '../'.repeat(d) : '') + 'css/';
  }

  function swapStylesheet(modern) {
    var link = document.getElementById('honchie-main-css');
    if (link) {
      link.href = getCssBase() + (modern ? 'shop-modern.css' : 'shop.css');
    }
  }

  function isModern() {
    return document.documentElement.classList.contains('theme-modern');
  }

  function setTheme(modern) {
    if (modern) {
      document.documentElement.classList.add('theme-modern');
      localStorage.setItem(STORAGE_KEY, 'modern');
    } else {
      document.documentElement.classList.remove('theme-modern');
      localStorage.setItem(STORAGE_KEY, 'classic');
    }
    swapStylesheet(modern);
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
    tagline.textContent = randomTagline();
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
      document.documentElement.classList.add('theme-modern');
    }
    createButton();
    updateLogos(modern);
    updateTagline(modern);
  }
})();
