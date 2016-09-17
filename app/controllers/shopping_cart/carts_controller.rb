require_dependency "shopping_cart/application_controller"

module ShoppingCart
  class CartsController < ApplicationController
    def show
      @order = current_order
    end
  end
end
