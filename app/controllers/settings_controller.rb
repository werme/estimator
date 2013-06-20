class SettingsController < ApplicationController
  def index
    @project_types = ProjectType.all
  end
end