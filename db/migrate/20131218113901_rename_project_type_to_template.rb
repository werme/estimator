class RenameProjectTypeToTemplate < ActiveRecord::Migration
  def change
    rename_table :project_types, :templates
  end
end
