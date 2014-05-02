class RenameUserToAuthorInEstimate < ActiveRecord::Migration
  def change
    rename_column :estimates, :user_id, :author_id
  end
end
