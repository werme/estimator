class MakeHoursIntegerAgain < ActiveRecord::Migration
  def change
    change_column :tasks, :hours, :integer
  end
end
