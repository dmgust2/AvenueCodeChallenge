require 'rails_helper'

# rspec spec/controllers/tasks_controller_spec.rb


RSpec.describe TasksController, type: :controller do
  # DMG: Need this here for Devise sessions (warden stuff)
  include Devise::Test::ControllerHelpers

  before :each do
    # Sign-in a user due to auth
    @user_1 = FactoryGirl.create(:user_1)
    login_as(@user_1, :scope => :user)

    # Seed one public task for this user
    @pub_task_1 = FactoryGirl.create(:pub_task_1)

    # Seed one private task for another user
    @other_private_task_3 = FactoryGirl.create(:other_private_task_3)
  end

  describe 'POST create' do
    context 'private task with valid attributes' do
      it 'creates a new task' do
        post :create, params: { task: FactoryGirl.attributes_for(:private_task_2) }

        # There now should be two Public tasks in the system
        expect(Task.count).to eq(2)
      end
    end
  end

  # The Task Details page
  describe 'GET show' do
    it 'renders the tasks show page' do
      get :show, params: { id: @pub_task_1.id }

      expect(response).to render_template(:show)
    end
  end
end
