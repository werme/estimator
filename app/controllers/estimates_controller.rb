class EstimatesController < ApplicationController
  load_and_authorize_resource

  def index
    @estimates = Estimate.all
  end

  def show
    @estimate = Estimate.find(params[:id])
    @note = Note.new
    @estimate.tasks.each { |t| unless t.tasks.empty? then t.hours = t.tasks.map(&:hours).inject(0, :+); t.save end }
    @total = @estimate.tasks.map { |t| t.hours * t.rate }.sum
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
      flash[:error] = estimate.errors.full_messages.to_sentence
      redirect_to estimates_path
    end
  end

  def edit
    @estimate = Estimate.find(params[:id])
  end

  def update
    estimate = Estimate.find params[:id]
    estimate.editors << User.find_by_email(params[:editor])

    if estimate.update_attributes(estimate_params)
      redirect_to estimate
    else
      flash[:error] = estimate.errors.full_messages.to_sentence
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
    params.require(:estimate).permit(:project, :description, :user_id)#, editors_attributes: [:user])
  end
end
