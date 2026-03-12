(function() {
  var ROTATE_MS = 4500;
  var timer = null;
  var THUMB_TO_FULL = { 'joe.jpeg': 'joe.jpg', 'imonkey.jpg': 'imonk.jpg', 'fecal.jpg': 'fecalmist.jpg', 'thumb3.jpg': '3.jpg', 'condom2th.jpg': 'condom2.jpg', 'thumbmrt.jpg': 'mrt.jpg' };

  function shuffle(arr) {
    var a = arr.slice();
    for (var i = a.length - 1; i > 0; i--) {
      var j = Math.floor(Math.random() * (i + 1));
      var t = a[i]; a[i] = a[j]; a[j] = t;
    }
    return a;
  }

  function getImagePath(product) {
    var val = product.image || product.thumbnails || '';
    if (!val) return 'images/storefront/placeholder.gif';
    var s = String(val).replace(/^#+|#+$/g, '').trim();
    if (s.indexOf('http') === 0) return s;
    var fname = s.split('/').pop();
    fname = THUMB_TO_FULL[fname] || fname;
    return 'images/full-modern/' + fname;
  }

  function getFallbackPath(product) {
    var val = product.image || product.thumbnails || '';
    if (!val) return 'images/storefront/placeholder.gif';
    var s = String(val).replace(/^#+|#+$/g, '').trim();
    if (s.indexOf('http') === 0) return s;
    var path = s.startsWith('images/') ? s : 'images/full/' + s.split('/').pop();
    if (path.indexOf('/thumb/') >= 0) {
      var f = path.split('/').pop();
      path = 'images/full/' + (THUMB_TO_FULL[f] || f);
    }
    return path;
  }

  function init() {
    var carousel = document.getElementById('homepage-carousel');
    if (!carousel) return;
    var isModern = document.documentElement.classList.contains('theme-modern') || document.body.classList.contains('theme-modern');
    if (!isModern) {
      clearInterval(timer);
      timer = null;
      carousel.style.display = 'none';
      carousel.setAttribute('aria-hidden', 'true');
      return;
    }
    carousel.style.display = 'block';
    carousel.setAttribute('aria-hidden', 'false');

    var slidesEl = document.getElementById('carousel-slides');
    if (slidesEl && slidesEl.children.length > 0) return;

    var products = shuffle((window.PRODUCTS_DATA || {}).products || []);
    if (!products.length) return;

    var slidesEl = document.getElementById('carousel-slides');
    var captionEl = document.getElementById('carousel-caption');
    if (!slidesEl || !captionEl) return;

    var idx = 0;
    products.forEach(function(p, i) {
      var imgPath = getImagePath(p);
      var fallback = getFallbackPath(p);
      var productUrl = 'product.html?id=' + p.id;
      var slide = document.createElement('a');
      slide.href = productUrl;
      slide.className = 'carousel-slide' + (i === 0 ? ' active' : '');
      slide.setAttribute('aria-hidden', i !== 0);
      slide.innerHTML = '<img src="' + imgPath + '" alt="' + (p.name || '').replace(/"/g, '&quot;') + '" data-fallback="' + fallback + '" onerror="if(this.dataset.fallback)this.src=this.dataset.fallback">';
      slidesEl.appendChild(slide);
    });

    function showSlide(i) {
      idx = (i + products.length) % products.length;
      var slides = slidesEl.querySelectorAll('.carousel-slide');
      slides.forEach(function(s, j) {
        s.classList.toggle('active', j === idx);
        s.setAttribute('aria-hidden', j !== idx);
      });
      var name = (products[idx].name || '').replace(/</g, '&lt;').replace(/>/g, '&gt;');
      captionEl.innerHTML = '<a href="product.html?id=' + products[idx].id + '">' + name + '</a>';
    }

    function resetTimer() {
      clearInterval(timer);
      timer = setInterval(function() { showSlide(idx + 1); }, ROTATE_MS);
    }
    resetTimer();
  }

  function runInit() {
    init();
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', runInit);
    window.addEventListener('load', runInit);
  } else {
    runInit();
  }

  document.addEventListener('themeChanged', function() { init(); });
})();
