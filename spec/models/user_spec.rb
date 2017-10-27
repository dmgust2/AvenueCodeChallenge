require 'rails_helper'

# rspec spec/models/user_spec.rb


RSpec.describe User, type: :model do
  it 'has a valid factory' do
    user_1 = FactoryGirl.create(:user_random_1)
    expect(user_1).not_to be_nil
  end
end
