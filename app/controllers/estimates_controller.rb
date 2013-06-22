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

    unless params[:default][:project_type_id].empty?
      project_type = ProjectType.find(params[:default][:project_type_id])
      estimate.tasks = project_type.tasks
      estimate.tasks.each { |t| t.rate = project_type.default_rate || 0; t.hours = 0 }
    end

    if estimate.save
      redirect_to estimate
    else
      redirect_to estimates_path
    end
  end

  def edit
    @estimate = Estimate.find(params[:id])
  end

  def update
    estimate = Estimate.find params[:id]

    if estimate.update_attributes(estimate_params)
      redirect_to estimate
    else
      redirect_to estimate
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
