class AddTextToNote < ActiveRecord::Migration
  def change
    add_column :notes, :text, :text
  end
end
