class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
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
    @task = Task.new(task_params)
    @task.update(params[:task])

    redirect_to task_path(@task)
  end

  def destroy
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :done)
  end
end
