class EstimatesController < ApplicationController

  def index
    @default_rate = 0
    @estimates = Estimate.all
  end

  def show
    @estimate = Estimate.find(params[:id])
  end

  def new
    @estimate = Estimate.new
  end

  def create
    estimate = Estimate.create(project: params[:project])
    estimate.save
    redirect_to :root
  end

end
