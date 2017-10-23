class TasksController < ApplicationController
  # Authenticate (user login) prior to any actions (index, new)
  before_action :authenticate_user!

  # Devise notes:
  # - For the current signed-in user: current_user
  # - To verify if a user is signed in: user_signed_in?
  # - Access the session for this scope: user_session

  # Display tasks in the system according to public_viewable
  def index
    begin
      # TODO: For testing: Display all tasks in the DB
      @all_tasks = Task.all

      @public_tasks = Task.where(public_viewable: true)

      @private_tasks = Task.where(public_viewable: false)

      # DEBUG
      logger.debug("DEBUG: TasksController:index:current_user #{current_user}")

      # Display ALL public tasks and any private tasks for the signed-in user
      # TODO: Add some kind of filter? I want ALL public tasks and then any of the signed-in user's private tasks
      #@task_list = Task.where(:public_viewable == true).and(:owner == current_user, :public_viewable == false)
    rescue Exception => e
      logger.debug(e.backtrace.awesome_inspect)
      logger.error("ERROR: TasksController:index: #{e.message}")
    end
  end

  def show
    begin
      @task = Task.find(params[:id])

    rescue Exception => e
      logger.error("ERROR: TasksController:show: #{e.message}")
    end
  end

  def new
    begin
      @task = Task.new

    rescue Exception => e
      logger.error("ERROR: TasksController:new: #{e.message}")
    end
  end

  def create
    begin
      @task = Task.create!(allowed_params)

      redirect_to tasks_url

    rescue Exception => e
      logger.debug(e.backtrace.awesome_inspect)
      logger.error("ERROR: TasksController:create: #{e.message}")
    end
  end

  def update
    begin
      @task = Task.find(params[:id])
      @task.update_attributes!(allowed_params)

      redirect_to tasks_url

    rescue Exception => e
      logger.debug(e.backtrace.awesome_inspect)
      logger.error("ERROR: TasksController:update: #{e.message}")
    end
  end

  def destroy
    begin
      @task = Task.destroy(params[:id])

      redirect_to tasks_url

    rescue Exception => e
      logger.debug(e.backtrace.awesome_inspect)
      logger.error("ERROR: TasksController:destroy: #{e.message}")
    end
  end


  private

    def allowed_params
      params.require(:task).permit(:owner, :public_viewable, :name)
    end

end
