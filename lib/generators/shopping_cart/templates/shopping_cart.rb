ShoppingCart.setup do |config|
  #Name of product class
  config.product_class = 'Product'
  #Name of Order item class
  config.order_item_class = 'ShoppingCart::OrderItem'
  #Name of User class
  config.user_class = 'User'
  #User's table name
  config.user_table = :users
  #Ability to apply coupon with discount in the cart
  config.order_has_coupon = true
  #If true, at the begin billing, shipping address and credit card will be taken from user.
  config.contactable_user = true
end