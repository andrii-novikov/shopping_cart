# This migration comes from shopping_cart (originally 20160917100116)
class CreateShoppingCartDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_cart_deliveries do |t|
      t.string :name
      t.float :cost

      t.timestamps
    end
  end
end
