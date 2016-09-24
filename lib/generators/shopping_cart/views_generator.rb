module ShoppingCart
  module Generators
    class ViewsGenerator < Rails::Generators::Base
      source_root File.expand_path('../../../../app/views/', __FILE__)

      def copy_initializer
        directory 'shopping_cart', 'app/views/shopping_cart'
      end
    end
  end
end
