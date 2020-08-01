FactoryBot.define do
  factory :weather do
    city { "MyString" }
    state { "MyString" }
    country { "MyString" }
    high { "MyString" }
    low { "MyString" }
    date { "MyString" }
    time { "MyString" }
    summary { "MyString" }
    feels_like { "MyString" }
    humidity { "MyString" }
    visibility { "MyString" }
    uv_index { "MyString" }
    sunrise { "MyString" }
    sunset { "MyString" }
  end
end
