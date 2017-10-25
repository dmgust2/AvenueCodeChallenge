class Task < ApplicationRecord
  has_many :subtasks, inverse_of: :task, :dependent => :delete_all
  accepts_nested_attributes_for :subtasks, :allow_destroy => true

  # Validation
  validates :name, presence: true, length: { minimum: 1 }
end
