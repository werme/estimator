class AddProjectToEstimate < ActiveRecord::Migration
  def change
    add_column :estimates, :project, :string
  end
end
