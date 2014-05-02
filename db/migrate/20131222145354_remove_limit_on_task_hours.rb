class RemoveLimitOnTaskHours < ActiveRecord::Migration
  def change
    change_column(:tasks, :hours, :integer, limit: nil)
  end
end
