module ShoppingCart
  class Engine < ::Rails::Engine
    isolate_namespace ShoppingCart

    initializer 'shopping_cart' do
      # ActiveSupport.on_load :active_record do
      #   ActiveRecord::Base.include ShoppingCart::ModelMethods
      # end

      ActiveSupport.on_load :action_controller do
        ActionController::Base.include ShoppingCart::ControllerActions
        ActionController::Base.helper ShoppingCart::ApplicationHelper
        ActionController::Base.helper ShoppingCart::CartsHelper
      end
    end
  end
end
