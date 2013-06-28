class AddUserToProjectTypes < ActiveRecord::Migration
  def change
    add_reference :project_types, :user, index: true
  end
end
