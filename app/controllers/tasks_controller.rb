class TasksController < ApplicationController
  # Authenticate (user login) prior to any actions
  before_action :authenticate_user!


  def index
    # Display ALL public tasks and any private tasks for the signed-in user
    @task_list = Task.where("public_viewable = ? OR owner = ?", true, current_user.email)
  end

  def show
    # TODO: Add error handling (e.g. if task was deleted by owner)
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new

    # This basically creates an empty shell, needed for seeding and forms
    @task.subtasks.build
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(allowed_params)

    if @task.save
      redirect_to root_url, notice: 'Successfully created task.'
    else
      render :new
    end
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(allowed_params)
      redirect_to root_url, notice: 'Successfully updated task.'
    else
      render :edit
    end
  end

  def destroy
    @task = Task.destroy(params[:id])

    redirect_to root_url, notice: 'Successfully deleted this task and any subtasks.'
  end


  private

    def allowed_params
      params.require(:task).permit(:owner, :public_viewable, :name, subtasks_attributes: [:id, :name, :_destroy])
    end

end
