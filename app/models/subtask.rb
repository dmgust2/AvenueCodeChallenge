class Subtask < ApplicationRecord
  belongs_to :task, inverse_of: :subtasks

  # Validation
  validates :name, presence: true, length: { minimum: 1 }
end
