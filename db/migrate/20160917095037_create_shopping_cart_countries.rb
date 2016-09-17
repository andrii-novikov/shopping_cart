class CreateShoppingCartCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_cart_countries do |t|
      t.string :title

      t.timestamps
    end
  end
end
