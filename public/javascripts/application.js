// Put your application scripts here
$(document).ready(function() {


  $( 'input[name="qty"]' ).change(
    function () {
    //event.preventDefault();
    //var url = $(form).attr("action");
    var formData = $(this).serialize();
      $.ajax("/cart_item/cart/9", {
        type :    "GET",
        data :    formData,
        success : function () {
          alert("Количество изменилось и стало" + ' ' + formData);
          //$(".total_cart").append()
          $(this).load('/cart_item/cart/'); 
          //$('#testers').load('/eye_testers');
        }
      })
  // End of AJAX request
  }

  );

});