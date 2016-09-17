module ShoppingCart
  class Country < ApplicationRecord
    validates :title, uniqueness: true, presence: true
  end
end
