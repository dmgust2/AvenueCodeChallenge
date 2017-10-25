require 'rails_helper'


# rspec spec/models/task_spec.rb


# Verify Model validation
RSpec.describe Task do
  it { is_expected.to validate_presence_of(:name) }
end