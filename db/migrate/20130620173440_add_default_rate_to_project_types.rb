class AddDefaultRateToProjectTypes < ActiveRecord::Migration
  def change
    add_column :project_types, :default_rate, :integer
  end
end
