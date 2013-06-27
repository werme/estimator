class PagesController < ApplicationController
  def front

  end

  def settings
    @project_types = ProjectType.all
  end
end
