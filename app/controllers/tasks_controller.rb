class TasksController < ApplicationController
  load_and_authorize_resource

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def new_child_task
    @task = Task.new
    @parent = Task.find params[:parent_id]
  end

  def edit
    @task = Task.find(params[:id])
  end

  def edit_child_task
    @task = Task.find params[:id]
    @parent = Task.find params[:parent_id]
  end

  def update
    task = Task.find params[:id]

    if task.update_attributes(task_params)
      redirect
    else
      flash[:error] = task.errors.full_messages.to_sentence
      redirect
    end
  end

  def create
    task = Task.new(task_params)

    if task.save
      redirect
    else
      flash[:error] = task.errors.full_messages.to_sentence
      redirect_to :back
    end
  end

  def destroy
    task = Task.find params[:id]
    task.destroy
    redirect
  end

  private

  def redirect
    if params[:estimate_id]
      redirect_to Estimate.find params[:estimate_id]
    elsif params[:parent_id]
      redirect_to Task.find(params[:parent_id]).estimate
    elsif params[:project_type_id]
      redirect_to ProjectType.find params[:project_type_id]
    else
      flash[:error] = "Something wierd happened, macaroni!"
      redirect_to :root
    end
  end

  def task_params
    params.require(:task).permit(:name, :rate, :hours, :parent_id, :estimate_id, :project_type_id)
  end
end
