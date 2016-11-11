FactoryGirl.define do
  factory :product do
    sequence(:title) { |n| "#{FFaker::Movie.title}#{n}" }
    price { 50 + rand(1000) }

    factory :ordered_product do
      transient do
        count 1
      end

      after(:create) do |product, evaluator|
        create(:order_item, product: product, count: evaluator.count)
      end
    end
  end
end
