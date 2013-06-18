class ChangeHoursToDecimal < ActiveRecord::Migration
  def change
    change_column :tasks, :hours, :decimal
  end
end
