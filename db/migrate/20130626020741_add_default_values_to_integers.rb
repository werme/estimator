class AddDefaultValuesToIntegers < ActiveRecord::Migration
  def change
    change_column :tasks, :rate, :integer, default: 0
    change_column :tasks, :hours, :integer, default: 0
  end
end
