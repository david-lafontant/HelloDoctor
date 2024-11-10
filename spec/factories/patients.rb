FactoryBot.define do
  factory :patient do
    first_name { "MyString" }
    last_name { "MyString" }
    birthdate { "2024-11-10" }
    sex { 1 }
    address_line1 { "MyString" }
    address_line2 { "MyString" }
    city { "MyString" }
    state { "MyString" }
    country { "MyString" }
    phone { 1 }
    email { "MyString" }
    user { nil }
  end
end
