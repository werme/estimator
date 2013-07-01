class ProjectTypesController < ApplicationController
  load_and_authorize_resource

  def show
    @project_type = ProjectType.find(params[:id])
    @task = Task.new
  end

  def new
    @project_type = ProjectType.new
  end

  def create
    project_type = ProjectType.new(project_type_params)
    project_type.user = current_user

    if project_type.save
      redirect_to project_type
    else
      redirect_to new_project_type_path
    end
  end

  def edit
    @project_type = ProjectType.find(params[:id])
  end

  def update
    project_type = ProjectType.find params[:id]

    if project_type.update_attributes(project_type_params)
      redirect_to project_type
    else
      redirect_to project_type
    end
  end

  def destroy
    project_type = ProjectType.find params[:id]
    project_type.destroy
    redirect_to settings_path
  end

  private

  def project_type_params
    params.require(:project_type).permit(:name, :description, :default_rate, :public)
  end
end
