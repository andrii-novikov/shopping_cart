# This migration comes from shopping_cart (originally 20160917101219)
class CreateShoppingCartOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_cart_orders do |t|
      t.float :total
      t.date :completed_at
      t.integer :status
      t.belongs_to :billing_address, foreign_key: true
      t.belongs_to :shipping_address, foreign_key: true
      t.belongs_to :delivery, foreign_key: true
      t.belongs_to :credit_card, foreign_key: true
      t.boolean :use_billing_address
      t.timestamps
    end
  end
end
