class AddEstimateToNote < ActiveRecord::Migration
  def change
    add_reference :notes, :estimate, index: true
  end
end
