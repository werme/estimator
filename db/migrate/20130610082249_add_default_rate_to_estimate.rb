class AddDefaultRateToEstimate < ActiveRecord::Migration
  def change
    add_column :estimates, :default_rate, :string
  end
end
