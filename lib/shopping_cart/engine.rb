module ShoppingCart
  class Engine < ::Rails::Engine
    isolate_namespace ShoppingCart

    config.before_initialize do
      config.i18n.load_path += Dir["#{config.root}/config/locales/**/*.yml"]
    end

    initializer 'shopping_cart' do
      ActiveSupport.on_load :active_record do
        ActiveRecord::Base.include ShoppingCart::ModelActions
      end

      ActiveSupport.on_load :action_controller do
        ActionController::Base.include ShoppingCart::ControllerActions
        ActionController::Base.helper ShoppingCart::ApplicationHelper
        ActionController::Base.helper ShoppingCart::CartsHelper
      end
    end
  end
end
