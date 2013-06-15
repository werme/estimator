class TasksController < ApplicationController
  def show
    @Task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.estimate = Estimate.find params[:estimate_id]
    if task.save
      redirect_to estimate_path Estimate.find params[:estimate_id]
    else
      redirect_to estimate_path Estimate.find params[:estimate_id]
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :rate, :hours, :estimate)
  end
end
