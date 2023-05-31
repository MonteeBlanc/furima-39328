require 'faker'
FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.free_email }
    password { 'Password1' }  # Ensure the password meets all requirements
    password_confirmation { password }
    name { '全角名前' }  # Ensure the name meets all requirements
    surname { '全角姓' }  # Ensure the surname meets all requirements
    name_katakana { 'ジョン' }
    surname_katakana { 'ドウ' }
    date_of_birth { Date.new(1990, 1, 1) }
  end
end



