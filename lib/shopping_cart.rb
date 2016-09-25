require 'shopping_cart/engine'
require 'shopping_cart/controller_actions'
require 'shopping_cart/model_actions'
require 'jquery-rails'
require 'haml'
require 'bootstrap-sass'
require 'devise'
require 'aasm'
require 'haml'
require 'drape'
require 'i18n'
require 'cancancan'
require 'jbuilder'
require 'shoulda-matchers'
require 'database_cleaner'
require 'ffaker'

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
