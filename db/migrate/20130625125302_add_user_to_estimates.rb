class AddUserToEstimates < ActiveRecord::Migration
  def change
    add_reference :estimates, :user, index: true
  end
end
