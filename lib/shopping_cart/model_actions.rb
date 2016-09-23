module ShoppingCart
  module ModelActions
    extend ActiveSupport::Concern

    module ClassMethods
      def define_as_product
        raise 'Product class must have attribute "price"' unless has_attribute? :price
        class_eval do
          has_many :order_items, class_name: ShoppingCart.order_item_class
        end
      end

      def has_orders
        class_eval do
          has_many :orders, class_name: 'ShoppingCart::Order'

          def order_in_progress
            return orders.in_progress.last unless orders.in_progress.empty?
            orders.create
          end
        end
      end
    end
  end
end