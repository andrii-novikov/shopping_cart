class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders, class_name: 'ShoppingCart::Order'

  def order_in_progress
    return orders.in_progress.last unless orders.in_progress.empty?
    orders.create
  end
end
