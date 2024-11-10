FactoryBot.define do
  factory :patient do
    first_name { 'naomi' }
    last_name { 'campbell' }
    birthdate { '2024-11-10' }
    sex { 'female' }
    address_line1 { 'rue borno # 4' }
    address_line2 { 'apt 4 rue paul' }
    city { 'kolkat' }
    state { 'geneva' }
    country { 'USA' }
    phone { '7898679063' }
    email { 'patient@patient.com' }
    user { User.first || association(:user) }
  end
end
