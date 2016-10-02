module ShoppingCart
  module ControllerActions
    extend ActiveSupport::Concern

    included do
      helper_method :current_order
    end

    def current_order
      return shopping_cart_user.order_in_progress if shopping_cart_user
      ShoppingCart::Order.find_by_id(session[:order_id]) || new_session_order
    end

    private
    def new_session_order
      order = ShoppingCart::Order.create(user: shopping_cart_user)
      session[:order_id] = order.id
      order
    end

    def shopping_cart_user
      send(ShoppingCart.current_user_method)
    end
  end
end