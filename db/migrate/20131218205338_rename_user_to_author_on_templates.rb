class RenameUserToAuthorOnTemplates < ActiveRecord::Migration
  def change
    rename_column :templates, :user_id, :author_id
  end
end
