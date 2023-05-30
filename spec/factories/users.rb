require 'faker'

FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    name { Faker::Name.first_name }
    surname { Faker::Name.last_name }
    name_katakana { 'ジョン' }
    surname_katakana { 'ドウ' }
    date_of_birth { Date.new(1990, 1, 1) }
  end
end


