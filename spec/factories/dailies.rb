FactoryBot.define do
  factory :daily do
    weather { nil }
    name { "MyString" }
    summary { "MyString" }
    precip { "MyString" }
    high { "MyString" }
    low { "MyString" }
  end
end
