class RemoveDefaultValuesForTaskIntegers < ActiveRecord::Migration
  def change
    change_column_default(:tasks, :hours, nil)
    change_column_default(:tasks, :rate, nil)
    change_column(:tasks, :rate, :integer, limit: nil)
  end
end
