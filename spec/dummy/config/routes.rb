Rails.application.routes.draw do
  root 'home#index'
  resources :products

  devise_for :users
  mount ShoppingCart::Engine => "/cart", as: 'shopping_cart'
  get 'home/index'
end
