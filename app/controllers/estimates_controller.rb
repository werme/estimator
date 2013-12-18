class EstimatesController < ApplicationController
  load_and_authorize_resource

  def index
    @estimates = Estimate.all
  end

  def show
    @estimate = Estimate.find params[:id]
    @note = Note.new
  end

  def new
    @estimate = Estimate.new
  end

  def create
    estimate = Estimate.new estimate_params

    unless params[:estimate][:template_id].empty?
      template = Template.find params[:estimate][:template_id]
      # Change to estimate.default_from(template)
      # estimate.tasks = template.tasks
      # estimate.tasks.each { |t| t.rate = template.default_rate || 0; t.hours = 0 }
    end

    if estimate.save
      redirect_to estimate
    else
      flash[:error] = estimate.errors.full_messages.to_sentence
      redirect_to estimates_path
    end
  end

  def edit
    @estimate = Estimate.find params[:id] 
  end

  def update
    estimate = Estimate.find params[:id]

    if estimate.update_attributes estimate_params
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

  def add_user
    @estimate = Estimate.find params[:estimate_id]
  end

  def update_users
    estimate = Estimate.find params[:estimate_id]

    unless params[:editor].empty?
      user = User.find_by_email params[:editor]
    
      if user
        if estimate.author == user
          flash[:error] = "#{user.name} is the author of this project"
        elsif estimate.editors.include? user
          flash[:notice] = "#{user.name} already has access to this project"
        else
          estimate.editors << user
          flash[:notice] = "Gave access to user #{user.name}"
        end
      else
        flash[:error] = "No such user"
        # send invite
      end
    end

    redirect_to estimate
  end

  private

  def estimate_params
    params.require(:estimate).permit(:project, :description, :user_id) #, editors_attributes: [:user])
  end
end
