
FactoryGirl.define do

  factory :user_1, class: User do
    email               'user@example.com'
    password            'foobar'
    sign_in_count       1
    current_sign_in_ip  { Faker::Internet.ip_v4_address }
    last_sign_in_ip     { Faker::Internet.ip_v4_address }
    current_sign_in_at  { Faker::Date.between(2.days.ago, Date.today) }
    last_sign_in_at     { Faker::Date.backward(5) }
  end

  factory :user_random_1, class: User do
    email               { Faker::Internet.email }
    password            'f4k3p455w0rd'
    sign_in_count       1
    current_sign_in_ip  { Faker::Internet.ip_v4_address }
    last_sign_in_ip     { Faker::Internet.ip_v4_address }
    current_sign_in_at  { Faker::Date.between(2.days.ago, Date.today) }
    last_sign_in_at     { Faker::Date.backward(5) }
  end

end