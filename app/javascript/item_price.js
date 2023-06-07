document.addEventListener('DOMContentLoaded', () => {
  if (document.getElementById('item-price')) {
    const priceInput = document.getElementById('item-price');
    const taxPriceElement = document.getElementById('add-tax-price');
    const profitElement = document.getElementById('profit');

    priceInput.addEventListener('input', () => {
      const price = parseInt(priceInput.value);
      const tax = Math.floor(price * 0.1);
      const profit = price - tax;

      taxPriceElement.textContent = tax.toLocaleString();
      profitElement.textContent = profit.toLocaleString();
    });
  }
});