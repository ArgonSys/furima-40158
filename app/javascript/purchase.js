function purchase () {
  const chargeForm = document.getElementById("charge-form");
  if(chargeForm == null) return null;
  
  const publicKey = gon.public_key;
  const payjp = Payjp(publicKey);
  const elements = payjp.elements();
  const numberElement = elements.create("cardNumber");
  const expiryElement = elements.create("cardExpiry");
  const cvcElement = elements.create("cardCvc");
  numberElement.mount("#number-form");
  expiryElement.mount("#expiry-form");
  cvcElement.mount("#cvc-form");
  
  chargeForm.addEventListener("submit", (e) => {
    e.preventDefault();
    payjp.createToken(numberElement).then( (response) => {
      if (!response.error){
      const token = response.id;
      const tokenObj = `<input value=${token} name=token type=hidden>`;
      chargeForm.insertAdjacentHTML("beforeend", tokenObj);
      }

      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();
      chargeForm.submit();
    });
  });

}

window.addEventListener("turbo:load", purchase)
window.addEventListener("turbo:render", purchase)