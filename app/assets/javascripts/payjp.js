document.addEventListener(
  "DOMContentLoaded", (e) => {
    Payjp.setPublicKey("pk_test_89e8977561e76bb51c9353dc");
    const btn = document.getElementById('token_submit');
    btn.addEventListener("click", (e) => {
      e.preventDefault();

      const card = {
        number: document.getElementById("card_number").value,
        cvc: document.getElementById("cvc").value,
        exp_month: document.getElementById("exp_month").value,
        exp_year: document.getElementById("exp_year").value
      };       
      Payjp.createToken(card, (status, response) => {
        if (status === 200) { 
          $("#card_number").removeAttr("name");
          $("#cvc").removeAttr("name");
          $("#exp_month").removeAttr("name");
          $("#exp_year").removeAttr("name");
          var token = response.id;
          $("#card_form").append($('<input type="hidden" name="payjp-token" />').val(token));    
          document.inputForm.submit();
        } else {
          alert("カード情報が正しくありません。");
        }
      });
    });
  },
  false
  );