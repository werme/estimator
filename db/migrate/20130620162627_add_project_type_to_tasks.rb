class AddProjectTypeToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :project_type_id, :integer
  end
end
