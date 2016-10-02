require 'shopping_cart/engine'
require 'shopping_cart/controller_actions'
require 'shopping_cart/model_actions'

Gem.loaded_specs['shopping_cart'].runtime_dependencies.each do |d|
  require d.name
end

module ShoppingCart
  mattr_accessor :product_class
  mattr_accessor :order_item_class
  mattr_accessor :user_class
  mattr_accessor :user_table
  mattr_accessor :order_has_coupon
  mattr_accessor :contactable_user
  mattr_accessor :current_user_method

  def self.setup
    yield self
  end
end
