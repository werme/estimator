class AddEstimateToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :estimate_id, :integer
  end
end
