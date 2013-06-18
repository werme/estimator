class TasksController < ApplicationController
  def show
    @task = Task.find(params[:id])
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

  def destroy
    task = Task.find params[:id]
    task.destroy
    redirect_to estimate_path Estimate.find params[:estimate_id]
  end

  private

  def task_params
    params.require(:task).permit(:name, :rate, :hours, :estimate)
  end
end
