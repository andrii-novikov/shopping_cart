module ShoppingCart
  module Discountable
    extend ActiveSupport::Concern

    included do
      belongs_to :coupon
      DEFAULT_DISCOUNT_COEFFICIENT = 1

      def apply_coupon(coupon)
        update(coupon: coupon) if coupon.is_a? Coupon
      end

      def discount
        return coupon.discount_coefficient if coupon.present?
        DEFAULT_DISCOUNT_COEFFICIENT
      end
    end
  end
end