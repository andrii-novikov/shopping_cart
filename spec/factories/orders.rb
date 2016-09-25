FactoryGirl.define do
  factory :order, class: ShoppingCart::Order do
    user
    association :billing_address, factory: :address
    association :shipping_address, factory: :address
    delivery
    credit_card

    after(:create) do |order, _evaluator|
      order.order_items << FactoryGirl.create(:order_item, order: order)
    end
  end
end
