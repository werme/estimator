class CreateEstimates < ActiveRecord::Migration
  def change
    create_table :estimates do |t|

      t.timestamps
    end
  end
end
