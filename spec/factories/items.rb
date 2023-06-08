FactoryBot.define do
  factory :item do
    title { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph }
    price { Faker::Commerce.price(range: 100..10000) }
    association :category, factory: :category
    association :condition, factory: :condition
    association :shipping_day, factory: :shipping_day
    association :shipping_fee_payer, factory: :shipping_fee_payer
    association :shipping_area, factory: :shipping_area
    user
  end
end
