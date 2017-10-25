FactoryGirl.define do

  factory :task_1 do
    owner               { Faker::Internet.email }
    public_viewable     true
    name                'Dummy Test Public task 1'
  end

  factory :task_2 do
    owner               { Faker::Internet.email }
    public_viewable     false
    name                'Dummy Test Private task 2'
  end

  factory :task_3 do
    owner               { Faker::Internet.email }
    public_viewable     true
    name                'Dummy Test Public task 3'
  end
end