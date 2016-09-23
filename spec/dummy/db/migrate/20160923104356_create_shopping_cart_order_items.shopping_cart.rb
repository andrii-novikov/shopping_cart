# This migration comes from shopping_cart (originally 20160917101412)
class CreateShoppingCartOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_cart_order_items do |t|
      t.integer :count
      t.float :cost
      t.belongs_to :order, foreign_key: true
      t.belongs_to :product, foreign_key: true

      t.timestamps
    end
  end
end
