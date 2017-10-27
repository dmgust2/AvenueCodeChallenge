require 'rails_helper'

# rspec spec/controllers/subtasks_controller_spec.rb


RSpec.describe SubtasksController, type: :controller do
  # DMG: Need this here for Devise sessions (warden stuff)
  include Devise::Test::ControllerHelpers

  before :each do
    # Sign-in a user due to auth
    @user_1 = FactoryGirl.create(:user_1)
    login_as(@user_1, :scope => :user)
    #ap @user_1

    #@token = login(create(:user_1, password: 'password'))
    #ap @token

    # Seed one public task for this user
    @pub_task_1 = FactoryGirl.create(:pub_task_1)
    #ap @pub_task_1

    # Seed one subtask for the above task for this user
    @pub_subtask_1 = FactoryGirl.create(:pub_subtask_1, task_id: @pub_task_1.id)
    # ap @pub_subtask_1
  end

  describe 'POST create' do
    context 'subtask with valid attributes' do
      it 'creates a new subtask' do
        # Route POST /tasks/{task_id}/subtasks
        # parameters: {"utf8"=>"✓", "authenticity_token"=>"cMuMGl2mx4x8voz/DuZ4nMCaQNR81UUXwElhzlshSUtzZU/iHMHV12ykuJpVtPqh+vZROVtC/moPMGSQ2I+8hw==", "subtask"=>{"name"=>"foo 1A"}, "commit"=>"Create Subtask", "task_id"=>"21"}
        #post :create, params: { task_id: @pub_task_1.id, subtask: FactoryGirl.attributes_for(:pub_subtask_2) }
        post :create, params: { authenticity_token: @token, subtask: FactoryGirl.attributes_for(:pub_subtask_2), task_id: @pub_task_1.id }

        # There now should be two subtasks in the system
        expect(Subtask.count).to eq(2)
      end
    end
  end

end