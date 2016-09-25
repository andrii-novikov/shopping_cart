FactoryGirl.define do
  factory :order_item, class: ShoppingCart::OrderItem do
    product
    order
    count '1'
  end
end
