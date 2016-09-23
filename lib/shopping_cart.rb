require "shopping_cart/engine"
require "shopping_cart/controller_actions"
require "shopping_cart/model_actions"
require 'jquery-rails'
require 'haml'
require 'bootstrap-sass'
require "devise"
require "aasm"
require "haml"
require "drape"
require "i18n"
require "cancancan"
require "jbuilder"

module ShoppingCart
  mattr_accessor :product_class
  @@product_class = 'Product'

  mattr_accessor :order_item_class
  @@order_item_class = 'ShoppingCart::OrderItem'

  mattr_accessor :user_class
  @@user_class = 'User'

  mattr_accessor :order_has_coupon
  @@order_has_coupon = true

  def self.setup
    yield self
  end
end
