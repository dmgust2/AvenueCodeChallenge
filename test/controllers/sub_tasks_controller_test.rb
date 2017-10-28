require 'test_helper'

class SubTasksControllerTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers
  #fixtures :subtasks


  def setup
    # Sign-in a user due to Devise auth
    @user_1 = FactoryGirl.create(:user_1)
    login_as(@user_1, :scope => :user)
    #ap @user_1

    # Seed one public task for this user
    @pub_task_1 = FactoryGirl.create(:pub_task_1)

    # Seed one subtask for the above task and this user
    @pub_subtask_1 = FactoryGirl.create(:pub_subtask_1)
  end


  # Simple model test
  test 'verify subtask model constraints' do
    subtask = Subtask.new
    assert_not subtask.save, 'Saved the subtask without a name'
  end

  # Create a new subtask
  test 'create a new subtask' do
    # Call tasks#show (page we create new tasks on)
    get tasks_url + "/#{@pub_task_1.id}"
    assert_response :success

    # Call subtasks#new /tasks/:task_id/subtasks/new
    get tasks_url + "/#{@pub_task_1.id}/subtasks/new", xhr: true
    assert_response :success

    # Call subtasks#create -> /tasks/:task_id/subtasks
    new_subtask_name = 'user@example.com Public subtask 2'
    post tasks_url + "/#{@pub_task_1.id}/subtasks", params: { subtask: { name: new_subtask_name } }
    assert_response :redirect

    # Follow redirect to Task Details
    follow_redirect!
    assert_response :success

    # Verify some page contents
    assert_match(new_subtask_name, @response.body)

    # DEBUG
    Rails.logger.debug("\nDEBUG: SubTasksControllerTest:test_create_a_new_subtask: response:\n#{response.awesome_inspect}")
  end

  # Update an existing subtask
  test 'update a subtask' do
    new_name = 'test subtask update foo'
    # Call PATCH  subtasks#update -> /tasks/:task_id/subtasks/:id
    patch tasks_url + "/#{@pub_task_1.id}/subtasks/#{@pub_subtask_1.id}", params: { task: { task_id: @pub_task_1.id }, subtask: { name: new_name } }
    assert_response :redirect

    # Follow redirect to Task Details
    follow_redirect!
    assert_response :success

    # Verify some page contents
    assert_match(new_name, @response.body)

    # DEBUG
    Rails.logger.debug("\nDEBUG: SubTasksControllerTest:test_update_a_subtask: response:\n#{response.awesome_inspect}")
  end

  # Delete an existing subtask
  test 'delete a subtask' do
    # Call subtasks#destroy -> /tasks/:task_id/subtasks/:id
    delete tasks_url + "/#{@pub_task_1.id}/subtasks/#{@pub_subtask_1.id}"
    assert_response :redirect

    # Follow redirect to Task Details
    follow_redirect!
    assert_response :success

    # DEBUG
    Rails.logger.debug("\nDEBUG: SubTasksControllerTest:test_delete_a_subtask: response:\n#{response.awesome_inspect}")
  end

  # TODO: Test JS variants
end
