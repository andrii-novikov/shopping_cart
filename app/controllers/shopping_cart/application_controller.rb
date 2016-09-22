module ShoppingCart
  class ApplicationController < ::ApplicationController
    # protect_from_forgery with: :exception
    include ShoppingCart::ControllerActions
    layout "application"
  end
end