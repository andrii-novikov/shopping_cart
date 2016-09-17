Rails.application.routes.draw do
  root 'home#index'

  devise_for :users
  mount ShoppingCart::Engine => "/cart"
  get 'home/index'
end
