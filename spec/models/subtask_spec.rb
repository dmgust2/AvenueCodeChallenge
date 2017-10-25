require 'rails_helper'


# rspec spec/models/subtask_spec.rb


# Verify Model validation
RSpec.describe Subtask do
  it { is_expected.to validate_presence_of(:name) }
end
