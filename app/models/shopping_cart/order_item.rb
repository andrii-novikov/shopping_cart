module ShoppingCart
  class OrderItem < ApplicationRecord
    belongs_to :order
    belongs_to :product

    validates :count, presence: true, format: { with: /\d{1,2}/ }
    validate :validate_cost, on: create
    validates :product, presence: true
    validates :order, presence: true
    validates :product, uniqueness: { scope: :order_id }

    before_create :set_cost

    def total
      return 0 if cost.nil?
      count * cost
    end

    def set_cost
      self[:cost] = product.price
    end

    private

    def validate_cost
      errors.add(:cost, 'A cost must equal to book cost') if cost != book.cost
    end
  end
end
