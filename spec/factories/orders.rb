FactoryBot.define do
  factory :order do
    association :item
    price { Faker::Commerce.price(range: 100..10000) }
    token { "tok_abcdefghijk00000000000000000" }
  end
end





