class CreateShoppingCartCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_cart_credit_cards do |t|
      t.string :number
      t.string :expiration_mounth
      t.string :expiration_year
      t.string :code

      t.timestamps
    end
  end
end
