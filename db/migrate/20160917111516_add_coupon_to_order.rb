class AddCouponToOrder < ActiveRecord::Migration[5.0]
  def change
    add_reference :shopping_cart_orders, :coupon, foreign_key: true
  end
end
