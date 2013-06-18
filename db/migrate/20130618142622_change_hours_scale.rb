class ChangeHoursScale < ActiveRecord::Migration
  def change
    change_column :tasks, :hours, :decimal, :precision => 5, :scale => 2
  end
end
