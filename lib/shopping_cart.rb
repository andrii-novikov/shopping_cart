require 'shopping_cart/engine'
require 'shopping_cart/controller_actions'
require 'shopping_cart/model_actions'

Gem.loaded_specs['shopping_cart'].runtime_dependencies.each do |d|
  require d.name
end

module ShoppingCart
  mattr_accessor :product_class
  @@product_class = 'Product'

  mattr_accessor :order_item_class
  @@order_item_class = 'ShoppingCart::OrderItem'

  mattr_accessor :user_class
  @@user_class = 'User'

  mattr_accessor :user_table
  @@user_class = :users

  mattr_accessor :order_has_coupon
  @@order_has_coupon = true

  mattr_accessor :contactable_user
  @@contactable_user = true

  def self.setup
    yield self
  end
end
