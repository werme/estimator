class AddTaskToProjectType < ActiveRecord::Migration
  def change
    add_column :project_types, :task_id, :integer
  end
end
