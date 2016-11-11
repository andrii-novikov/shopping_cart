module ShoppingCart
  class OrdersController < ApplicationController
    before_action :authenticate_user!
    def index
      @orders = send(ShoppingCart.current_user_method).orders
    end

    def show
      @order = Order.find_by_id(params[:id])
    end
  end
  end
