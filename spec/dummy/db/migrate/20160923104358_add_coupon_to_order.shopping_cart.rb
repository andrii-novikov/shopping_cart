# This migration comes from shopping_cart (originally 20160917111516)
class AddCouponToOrder < ActiveRecord::Migration[5.0]
  def change
    add_reference :shopping_cart_orders, :coupon, foreign_key: true
  end
end
