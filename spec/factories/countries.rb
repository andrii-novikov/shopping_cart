FactoryGirl.define do
  factory :country, class: ShoppingCart::Country do
    sequence(:title) { |n| "#{FFaker::Address.country} #{n}" }
  end
end
