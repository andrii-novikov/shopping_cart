class CreateShoppingCartAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_cart_addresses do |t|
      t.string :firstname
      t.string :lastname
      t.string :street_address
      t.string :city
      t.string :zip
      t.string :phone
      t.references :country, foreign_key: true

      t.timestamps
    end
  end
end
