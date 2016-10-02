module ShoppingCart
  class OrderItemsController < ApplicationController
    before_action :set_order
    before_action :find_item, only: [:update, :destroy]
    respond_to :json

    def create
      @order_item = @order.order_items.create(create_params)
    end

    def update
      @order_item.update(update_params)
    end

    def destroy
      @order_item.destroy
    end

    private

    def create_params
      params.require(:order_item).permit(:count, :product_id)
    end

    alias_method :update_params, :create_params

    def set_order
      @order = current_order
    end

    def find_item
      @order_item = @order.order_items.find_by_id(params[:id])
    end
  end
end
