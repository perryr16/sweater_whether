FactoryBot.define do
  factory :road_trip do
    origin { "MyString" }
    destination { "MyString" }
    travel_time { "MyString" }
    arrival_temp { "MyString" }
    arrival_summary { "MyString" }
    user { nil }
  end
end
