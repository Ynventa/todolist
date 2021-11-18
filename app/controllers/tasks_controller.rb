class TasksController < ApplicationController
  include TasksHelper
  
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
    3.times{@task.to_dos.build}
  end

  def create
    @task = Task.new
    @task.assign_attributes(task_params)

    if @task.save
      redirect_to edit_task_path(@task)
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
    @task.to_dos.build
  end

  def update
    @task = Task.find(params[:id])
    @task.assign_attributes(task_params)

    if @task.save
      redirect_to edit_task_path(@task)
    else
      render :edit
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, to_dos_attributes: [:id, :title, :is_done, :_destroy])
  end  

end
