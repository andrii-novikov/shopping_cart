window.Cart =
  init: ->
    $(".add-to-cart").on("ajax:complete", Cart.onAddToCart);
    $("[id^=edit_order_item]").on("ajax:complete", Cart.onOrderItemUpdate);
    $('.shopping_cart_order_item a[data-method=delete]').on("ajax:complete", Cart.onOrderItemDelete);

  onAddToCart: (e, data, status, xhr) ->
    data = data.responseJSON;
    $(".cart-link").html(data.cart_text);
    $(".cart-btn-container#"+data.orders_item_id).html(data.btn);

  onOrderItemUpdate: (e, data, status, xhr) ->
    data = data.responseJSON;
    $("#shopping_cart_order_item_"+data.orders_item.id+" .total").html("$"+data.orders_item.total);
    $(".cart-content .cart-total").html("$"+data.order.subtotal);

  onOrderItemDelete: (e, data, status, xhr) ->
    data = data.responseJSON
    $(".cart-link").html(data.cart_text);
    $(".cart-content .cart-total").html("$"+data.order.subtotal);

    if data.cart_content
      $(".cart-content").html("<h2>"+data.cart_content+"</h2>")
    else
      $("#shopping_cart_order_item_"+data.orders_item_id).remove()