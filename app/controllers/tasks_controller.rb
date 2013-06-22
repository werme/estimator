class TasksController < ApplicationController
  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find params[:id]

    if task.update_attributes(task_params)
      redirect
    else
      redirect
    end
  end

  def create
    task = Task.new(task_params)

    if params[:estimate_id]
      task.estimate = Estimate.find params[:estimate_id]
    elsif params[:project_type_id]
      task.project_type = ProjectType.find params[:project_type_id]
    end

    if task.save
      redirect
    else
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
    elsif params[:project_type_id]
      redirect_to ProjectType.find params[:project_type_id]
    else
      redirect_to :root
    end
  end

  def task_params
    params.require(:task).permit(:name, :rate, :hours)
  end
end
