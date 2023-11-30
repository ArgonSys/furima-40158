
function fee() {
  const FEE_RATE = 0.1;
  const priceForm = document.getElementById("item-price");
  const feePrice = document.getElementById("add-tax-price");
  const profitPrice = document.getElementById("profit");
  priceForm.addEventListener("input", () => {
    const price = priceForm.value;
    const fee = Math.floor(price * FEE_RATE);
    const profit = price - fee;
    feePrice.innerHTML = fee;
    profitPrice.innerHTML = profit;
  })
};


window.addEventListener("turbo:load", () => {fee()});
window.addEventListener("turbo:render", () => {fee()});