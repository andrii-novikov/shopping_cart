module ShoppingCart
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    helper_method :current_order, :categories
    def current_order
      return current_user.order_in_progress if current_user
      Order.find_by_id(session[:order_id]) || new_session_order
    end

    def new_session_order
      order = Order.create(user: current_user)
      session[:order_id] = order.id
      order
    end
  end
end
