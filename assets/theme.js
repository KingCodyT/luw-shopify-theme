
(function () {
  const formatMoney = (cents) => {
    if (typeof Shopify !== 'undefined' && Shopify.formatMoney) {
      return Shopify.formatMoney(cents);
    }

    return new Intl.NumberFormat(document.documentElement.lang || 'en-US', {
      style: 'currency',
      currency: window.Shopify?.currency?.active || 'USD'
    }).format(cents / 100);
  };

  document.querySelectorAll('[data-product-form]').forEach((form) => {
    const section = form.closest('[data-section-id]');
    const variantsScript = document.querySelector('[data-product-json]');
    const idInput = form.querySelector('input[name="id"]');
    const price = section?.querySelector('[data-price]');
    const submit = form.querySelector('button[type="submit"]');

    if (!variantsScript || !idInput) return;

    let variants = [];
    try {
      variants = JSON.parse(variantsScript.textContent);
    } catch (error) {
      return;
    }

    const findSelectedVariant = () => {
      const selectedOptions = Array.from(form.querySelectorAll('[name^="options"]:checked')).map((input) => input.value);
      return variants.find((variant) => {
        return variant.options.every((option, index) => option === selectedOptions[index]);
      });
    };

    form.addEventListener('change', () => {
      const variant = findSelectedVariant();
      if (!variant) return;

      idInput.value = variant.id;

      if (price) {
        price.textContent = formatMoney(variant.price);
      }

      if (submit) {
        submit.disabled = !variant.available;
        submit.textContent = variant.available ? 'ADD TO CART' : 'Sold out';
      }
    });
  });
})();
