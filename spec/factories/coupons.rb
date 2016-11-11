FactoryGirl.define do
  factory :coupon, class: ShoppingCart::Coupon do
    name { FFaker::Lorem.word }
    discount { 1 + rand(99) }
  end
end
