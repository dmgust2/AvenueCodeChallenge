ENV["RAILS_ENV"] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/reporters'
Minitest::Reporters.use!

# This avoids 'No such file or directory - diff.exe' errors on windows with assert_equals
MiniTest::Assertions.diff = nil

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #fixtures :all

  # Add a sign-in method for minitest integration tests
  def sign_in(user:, password:)
    post user_session_path \
      'user[email]'    => user.email,
      'user[password]' => password
  end
end

# DMG: For devise
class ActionController::TestCase
  include Devise::Test::ControllerHelpers
end
