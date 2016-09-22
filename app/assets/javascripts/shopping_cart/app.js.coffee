window.App =
  init: ->
    Cart.init();
    Checkout.init();

$(document).ready App.init