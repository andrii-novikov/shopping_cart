class AddAdressCreditToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference ShoppingCart.user_table, :billing_address, foreign_key: true
    add_reference ShoppingCart.user_table, :shipping_address, foreign_key: true
    add_reference ShoppingCart.user_table, :credit_card, foreign_key: true
  end
end
