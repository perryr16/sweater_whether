require 'securerandom'
FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "User_#{n}@gmail.com" }
    api_key { SecureRandom.hex(30) }
  end
end
