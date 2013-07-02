class CreateEstimatesUsers < ActiveRecord::Migration
  def change
    create_table :estimates_users do |t|
      t.belongs_to :estimate
      t.belongs_to :user
    end
  end
end
