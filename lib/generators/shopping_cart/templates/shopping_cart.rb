ShoppingCart.setup do |config|
  config.product_class = 'Product'
  config.order_item_class = 'ShoppingCart::OrderItem'
  config.user_class = 'User'
  config.order_has_coupon = true
end