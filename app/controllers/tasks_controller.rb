class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new # Needed to instantiate the form_for
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params) # params[:task] would raise ActiveModel::ForbiddenAttributesError
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    # No need for app/views/tasks/destroy.html.erb
    redirect_to tasks_path, status: :see_other
    # status: :see_other responds with a 303 HTTP status code
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
    # Quando uso o form_for, ele já vem com o authenticity token. Então preciso só fazer:
    # params.require(:task).permit(:title, :details, :completed)
  end
end
