class PagesController < ApplicationController

  def front
  end

  def settings
    @templates = Template.all
    authorize! :view, :settings
  end
end
