FactoryGirl.define do
  factory :delivery, class: ShoppingCart::Delivery do
    name { FFaker::Company.name }
    cost '10'
  end
end
