class AddAdressCreditToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :billing_address, foreign_key: true
    add_reference :users, :shipping_address, foreign_key: true
    add_reference :users, :credit_card, foreign_key: true
  end
end
