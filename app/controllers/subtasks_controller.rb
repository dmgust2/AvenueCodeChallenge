class SubtasksController < ApplicationController
  # Authenticate (user login) prior to any actions
  before_action :authenticate_user!


  def index
    @all_subtasks = Subtask.all
  end

  def show
    @task = Task.find(params[:task_id])
    @subtask = Subtask.find(params[:id])

    redirect_to task_path(@task)
  end

  def new
    @task = Task.find(params[:task_id])
    @subtask = Subtask.new
  end

  def edit
    @task = Task.find(params[:task_id])
    @subtask = Subtask.find(params[:id])
  end

  # TODO: Get Ajax call working...
  def create
    @task = Task.find(params[:task_id])
    @subtask = @task.subtasks.create(allowed_params)

    respond_to do |f|
      f.html { redirect_to task_path(@task), notice: 'Successfully created subtask.' }
      f.js
    end
  end

  # TODO: If time, Get Ajax call working...
  def update
    @subtask = Subtask.find(params[:id])

    if @subtask.update(allowed_params)
      @task = Task.find(params[:task_id])
      redirect_to task_path(@task), notice: 'Successfully updated subtask.'
    else
      render :edit
    end
  end

  # TODO: If time, Get Ajax call working...
  def destroy
    @task = Task.find(params[:task_id])
    @subtask = Subtask.destroy(params[:id])

    redirect_to task_path(@task), notice: 'Successfully deleted subtask.'
  end


  private

    def allowed_params
      params.require(:subtask).permit(:name)
    end
end
