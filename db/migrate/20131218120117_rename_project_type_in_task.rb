class RenameProjectTypeInTask < ActiveRecord::Migration
  def change
    rename_column :tasks, :project_type_id, :template_id
  end
end
