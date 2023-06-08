FactoryBot.define do
  factory :shipping_information do
    postal_code { '123-4567' }
    shipping_area
    city { '東京都' }
    street { '1-1' }
    building { '東京ハイツ' }
    phone_number { '09012345678' }
    association :user
  end
end


