FactoryGirl.define do
  factory :credit_card, class: ShoppingCart::CreditCard do
    number { FFaker.numerify('################') }
    expiration_year '20'
    expiration_month '12'
    code { FFaker.numerify('###') }
  end
end
