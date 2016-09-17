module ShoppingCart
  class Delivery < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :cost, presence: true
  end
end
