require 'rails_helper'


# rspec spec/controllers/tasks_controller_spec.rb


RSpec.describe TasksController, type: :controller do
  describe "POST #create" do
    context "with valid attributes" do
      it "create new contact" do
        post :create, task: attributes_for(:task)
        expect(Task.count).to eq(1)
      end
    end
  end
end