require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers
  #fixtures :tasks

  def setup
    # Not sure why I need to set this here, but otherwise its always prefixing 'http://www.example.com:80'
    @session_1 = open_session
    @session_1.host! 'localhost:3000/'

    # Sign-in a user due to auth
    @user_1 = FactoryGirl.create(:user_1)
    login_as(@user_1, :scope => :user)
    #ap @user_1

    # Sign-in a test user
    # @password = 'foobar'
    # @signed_in_user = User.create(email: "#{rand(50000)}@foobar.com", password: @password)
    # sign_in(user: @signed_in_user, password: @password)
    # Rails.logger.debug("\nDEBUG: TasksController:setup: Current signed-in user email: #{@controller.current_user.email}")
  end


  # Simple model test
  test 'should not save task without name' do
    task = Task.new
    assert_not task.save, 'Saved the task without a name'
  end

  # Get index or the main task list page
  test 'get todo list' do
    @session_1.get 'tasks'
    # DEBUG
    response = response_from_page.to_s
    Rails.logger.debug("\nDEBUG: TasksControllerTest:test_get_todo_list: Page response:\n" + response)

    @session_1.assert_response :success
  end
end
