class Product < ApplicationRecord
  has_many :order_items, class_name: 'ShoppingCart::OrderItem'

  def price
    10+rand(50)
  end
end
