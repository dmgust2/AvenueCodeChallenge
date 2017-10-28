require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers
  #fixtures :tasks

  def setup
    # Session to avoid default prefixing of 'http://www.example.com:80'
    @session_1 = open_session
    @session_1.host! 'localhost:3000/'

    # Sign-in a user due to Devise auth
    @user_1 = FactoryGirl.create(:user_1)
    login_as(@user_1, :scope => :user)
    #ap @user_1

    # Seed one public task for this user
    @pub_task_1 = FactoryGirl.create(:pub_task_1)

    # Seed one private task for another user
    @other_private_task_3 = FactoryGirl.create(:other_private_task_3)


    # Sign-in a test user (alternate, but doesn't set auth stuff correctly for Devise)
    # @password = 'foobar'
    # @signed_in_user = User.create(email: "#{rand(50000)}@foobar.com", password: @password)
    # sign_in(user: @signed_in_user, password: @password)
    # Rails.logger.debug("\nDEBUG: TasksController:setup: Current signed-in user email: #{@controller.current_user.email}")
  end


  # Simple model test
  test 'verify task model constraints' do
    task = Task.new
    assert_not task.save, 'Saved the task without a name'
  end

  # Get index or the main task list page
  test 'get todo list' do
    # Alternate using sessions:
    #@session_1.get 'tasks'
    #@session_1.assert_response :success

    # Call tasks#index
    get tasks_url
    assert_response :success

    # Verify some page contents
    # <h1>TODO List</h1>
    assert_select('h1', 'TODO List')

    # DEBUG
    #Rails.logger.debug("\nDEBUG: TasksControllerTest:test_get_todo_list: response:\n#{response.awesome_inspect}")
  end

  # Get the show task details page
  test 'get task details' do
    # Call tasks#show
    get tasks_url + "/#{@pub_task_1.id}"
    assert_response :success

    # Verify some page contents
    # <h1>Task details</h1>
    assert_select('h1', 'Task details')
    # this task name: user@example.com Public task
    assert_match(@pub_task_1.name, @response.body)

    # DEBUG
    #Rails.logger.debug("\nDEBUG: TasksControllerTest:test_get_task_details: response:\n#{response.awesome_inspect}")
  end

  # Create a new task
  test 'create a new private task' do
    # Call tasks#new
    get tasks_url + '/new'
    assert_response :success

    # Call tasks#create
    post tasks_url, params: { task: FactoryGirl.attributes_for(:private_task_2) }
    assert_response :redirect

    # Follow redirect to index
    follow_redirect!
    assert_response :success

    # Verify some page contents
    assert_match('user@example.com Private task', @response.body)

    # DEBUG
    #Rails.logger.debug("\nDEBUG: TasksControllerTest:test_create_a_new_private_task: response:\n#{response.awesome_inspect}")
  end

  # Update an existing task
  test 'update a task' do
    new_name = 'test update foo'
    # Call tasks#update
    patch tasks_url + "/#{@pub_task_1.id}", params: { task: { name: new_name } }
    assert_response :redirect

    # Follow redirect to index
    follow_redirect!
    assert_response :success

    # Verify some page contents
    assert_match(new_name, @response.body)

    # DEBUG
    #Rails.logger.debug("\nDEBUG: TasksControllerTest:test_update_a_task: response:\n#{response.awesome_inspect}")
  end

  # TODO: Can't update a private task (created by another owner)

  # Delete an existing task
  test 'delete a task' do
    # Call tasks#destroy
    delete tasks_url + "/#{@pub_task_1.id}"
    assert_response :redirect

    # Follow redirect to index
    follow_redirect!
    assert_response :success

    # DEBUG
    #Rails.logger.debug("\nDEBUG: TasksControllerTest:test_delete_a_task: response:\n#{response.awesome_inspect}")
  end

  # TODO: Cascade delete a task and subtasks

end
