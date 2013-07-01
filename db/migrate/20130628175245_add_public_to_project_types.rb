class AddPublicToProjectTypes < ActiveRecord::Migration
  def change
    add_column :project_types, :public, :boolean
  end
end
