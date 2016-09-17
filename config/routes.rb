ShoppingCart::Engine.routes.draw do
  root 'carts#show'
  resources :orders_items, only: [:create, :update, :destroy]
  resources :orders, only: [:index, :show]
  resource :checkout, only: [:show, :update]
  resource  :cart, only: [:show]
  patch 'checkouts/make_order', as: 'make_order'
  patch 'coupons/apply', as: 'coupons'
end
