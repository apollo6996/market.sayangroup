// Put your application scripts here
  function deleteCartItem(item_id) {
    var url = '/cart_item/cart_items/' + item_id;
    $.ajax(url, {
      type: "DELETE",
      success : function () {
        $('#cart_item_' + item_id).fadeOut("fast");
      }
    })
  }


$(document).ready(function() {


  $( '.qty_cart' ).change(
    function () {
    var qty = $(this).val();
    var itemId = $(this).next('.item_id').val();
    var price = $(this).parent().find('.cart_price').val();
    var url = "/cart_item/change_qty/" + itemId + "/" + qty;
    var total = price * qty;
    var innersum = 0;

    var str1 = '<td id="total_' + itemId
    var str2 = '">'
      $.ajax(url, {
        type :    "PUT",
        success : function () {
          $('#total_' + itemId).replaceWith(str1 + str2 + total + " " + 'руб.</td>');     
          $('#item_total_' + itemId).attr('value', total )
          $('.item_total').each(function(){
              var total_all = Number($(this).val());
              innersum = innersum + total_all;
              return innersum;
              });
          $('#total_price').replaceWith('<h4 id="total_price">Сумма:'+ ' ' + innersum +' руб.</h4>'); 
        }
      })
  // End of AJAX request
    }
  );




});


