module ShoppingCart
  class OrdersController < ApplicationController
    def index
      @orders = current_user.orders
    end

    def show
      @order = Order.find_by_id(params[:id])
    end
  end
  end
