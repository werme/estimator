class EstimatesController < ApplicationController

  def index
    @estimates = Estimate.all
  end

  def show
    @estimate = Estimate.find(params[:id])
    @task = Task.new
    @total = @estimate.tasks.map { |t| if is_number? t.rate and is_number? t.hours then t.rate * t.hours else 0 end }.sum
  end

  def new
    @estimate = Estimate.new
  end

  def create
    estimate = Estimate.new(estimate_params)
    if estimate.save
      redirect_to estimate_path Estimate.find estimate.id
    else
      redirect_to estimates_path
    end
  end

  def destroy
    estimate = Estimate.find params[:id]
    estimate.destroy
    redirect_to estimate
  end

  private

  def estimate_params
    params.require(:estimate).permit(:project, :description)
  end
end
