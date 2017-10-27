
FactoryGirl.define do

  factory :pub_task_1, class: Task do
    owner               'user@example.com'
    public_viewable     true
    name                'user@example.com Public task'
  end

  factory :private_task_2, class: Task do
    owner               'user@example.com'
    public_viewable     false
    name                'user@example.com Private task'
  end

  factory :other_private_task_3, class: Task do
    owner               { Faker::Internet.email }
    public_viewable     false
    name                'Other user private task'
  end

end