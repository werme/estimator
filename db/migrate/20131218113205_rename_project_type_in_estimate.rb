class RenameProjectTypeInEstimate < ActiveRecord::Migration
  def change
    rename_column :estimates, :project_type_id, :template_id
  end
end
