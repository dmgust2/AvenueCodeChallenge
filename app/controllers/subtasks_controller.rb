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

  def create
    @task = Task.find(params[:task_id])
    @subtask = @task.subtasks.create(allowed_params)

    respond_to do |format|
      format.html { redirect_to task_path(@task) }
      format.js
    end
  end

  def update
    @task = Task.find(params[:task_id])
    @subtask = Subtask.find(params[:id])

    respond_to do |format|
      if @subtask.update(allowed_params)
        format.html { redirect_to task_path(@task) }
        format.js
      else
        render :edit
      end
    end
  end

  def destroy
    @task = Task.find(params[:task_id])
    @subtask = Subtask.destroy(params[:id])

    respond_to do |format|
      format.html { redirect_to task_path(@task) }
      format.js
    end
  end


  private

    def allowed_params
      params.require(:subtask).permit(:name)
    end
end
