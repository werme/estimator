class TemplatesController < ApplicationController
  load_and_authorize_resource

  def show
    @template = Template.find(params[:id])
    @task = Task.new
  end

  def new
    @template = Template.new
  end

  def create
    template = Template.new(template_params)
    template.user = current_user

    if template.save
      redirect_to template
    else
      flash[:error] = template.errors.full_messages.to_sentence
      redirect_to new_template_path
    end
  end

  def edit
    @template = Template.find(params[:id])
  end

  def update
    template = Template.find params[:id]

    if template.update_attributes(template_params)
      redirect_to template
    else
      flash[:error] = template.errors.full_messages.to_sentence
      redirect_to template
    end
  end

  def destroy
    template = Template.find params[:id]
    template.destroy
    redirect_to settings_path
  end

  private

  def template_params
    params.require(:template).permit(:name, :description, :default_rate, :public, :user_id)
  end
end
