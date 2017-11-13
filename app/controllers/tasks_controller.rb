class TasksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    if @task.save
      redirect_to list_path(@task.list)
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
    @task = @list.tasks.find(task_params)
    render :edit
  end

  def update
    @list= List.find(params[:id])
    task = @list.tasks.find(task_params)
    if @task.update(tasks_params)
      redirect_to list_path(@task.list)
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    @task = @list.tasks.find(task_params)
    @task.destroy
    redirect_to list_path(@task.list)
  end

  private
  def task_params
    params.require(:task).permit(:description)
  end
end
