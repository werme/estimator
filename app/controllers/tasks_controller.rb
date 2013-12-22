class TasksController < ApplicationController
  load_and_authorize_resource

  def show
    @task = Task.find params[:id]
  end

  def new
    @task = Task.new
  end

  def new_child_task
    @task   = Task.new
    @parent = Task.find params[:parent_id]
  end

  def edit
    @task = Task.find(params[:id])
  end

  def edit_child_task
    @task   = Task.find params[:id]
    @parent = Task.find params[:parent_id]
  end

  def create
    task = Task.new task_params

    if task.save
      redirect_to task.project
    else
      flash[:error] = task.errors.full_messages.to_sentence
      redirect_to :back
    end
  end
  
  def update
    task = Task.find params[:id]

    if task.update_attributes task_params 
      redirect_to task.project
    else
      flash[:error] = task.errors.full_messages.to_sentence
      redirect_to :back
    end
  end

  def destroy
    task = Task.find params[:id]
    if task.destroy
      redirect_to task.project
    else
      flash[:error] = task.errors.full_messages.to_sentence
      redirect_to :back
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :rate, :hours, :parent_id, :estimate_id, :template_id)
  end
end
