class AddDescriptionToEstimate < ActiveRecord::Migration
  def change
    add_column :estimates, :description, :string
  end
end
