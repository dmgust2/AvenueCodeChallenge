FactoryGirl.define do

  factory :user_1 do
    email               { Faker::Internet.email }
    sign_in_count       1
    current_sign_ip     { Faker::Internet.ip_v4_address }
    last_sign_in_ip     { Faker::Internet.ip_v4_address }
    current_sign_in_at  { Faker::Date.between(2.days.ago, Date.today) }
    last_sign_in_at     { Faker::Date.backward(5) }
  end

end