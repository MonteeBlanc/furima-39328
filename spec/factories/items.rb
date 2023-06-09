FactoryBot.define do
  factory :item do
    title { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph }
    price { Faker::Commerce.price(range: 100..10000) }
    condition_id { FactoryBot.create(:condition).id }
    category_id { FactoryBot.create(:category).id }
    shipping_day_id { FactoryBot.create(:shipping_day).id }
    shipping_fee_payer_id { FactoryBot.create(:shipping_fee_payer).id }
    shipping_area_id { FactoryBot.create(:shipping_area).id }
    user { FactoryBot.create(:user) }
  end
end


