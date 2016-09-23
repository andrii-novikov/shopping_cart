# This migration comes from shopping_cart (originally 20160917110553)
class CreateShoppingCartCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_cart_coupons do |t|
      t.string :name
      t.integer :discount

      t.timestamps
    end
  end
end
