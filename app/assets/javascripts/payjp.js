document.addEventListener(
  "DOMContentLoaded", e => {
    if (document.getElementById("submit-button") != null) { 
      Payjp.setPublicKey("pk_test_a1eb9220d826afa43a460ca0");
      let btn = document.getElementById("submit-button"); 
      btn.addEventListener("click", e => { 
        e.preventDefault();
        let card = {
          number: document.getElementById("payment_card_no").value,
          cvc: document.getElementById("payment_card_security_code").value,
          exp_month: document.getElementById("card__expiration--date-mm").value,
          exp_year: document.getElementById("card__expiration--date-yy").value
        }; 
        Payjp.createToken(card, function(s, response) {
          if (s != 200) {
            alert("error")
            form.find('button').prop('disabled', false);
          }
          else {
            $("#payment_card_no").removeAttr("name");
            $("#submit-button").removeAttr("name");
            $("#card__expiration--date-mm").removeAttr("name");
            $("#card__expiration--date-yy").removeAttr("name");
            
            var token = response.id;
            $.ajax({
              url: '/card/pay',
              type: "POST",
              data: { token: token },
              dataType: 'json',
            })
            $("#add-card-form").append($('<input type="hidden" name="payjp_token" class="payjp-token" />').val(token));
            $("#add-card-form").get(0).submit();
            alert("登録完了");
          }
        });
      });
    };
  });