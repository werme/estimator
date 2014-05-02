class UsersController < ApplicationController
  load_and_authorize_resource

  def show
    @user = User.find(params[:id])
    @templates = Template.where({ author: @user, public: true })
  end
end