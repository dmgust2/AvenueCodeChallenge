
FactoryGirl.define do

  factory :pub_subtask_1, class: Subtask do
    task_id   1
    name      'user@example.com Public subtask 1'
  end

  factory :pub_subtask_2, class: Subtask do
    task_id   1
    name      'user@example.com Public subtask 2'
  end

  factory :private_task_3, class: Task do
    task_id   2
    name      'user@example.com Private subtask 1'
  end

end