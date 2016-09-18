Rails.application.routes.draw do
  root 'home#index'

  devise_for :users
  mount ShoppingCart::Engine => "/cart", as: 'shopping_cart'
  get 'home/index'
  resource :product
end
