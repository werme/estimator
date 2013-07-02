class AddDoneToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :done, :boolean
  end
end
