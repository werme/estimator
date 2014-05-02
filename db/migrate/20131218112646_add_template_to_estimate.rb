class AddTemplateToEstimate < ActiveRecord::Migration
  def change
    add_reference :estimates, :project_type, index: true
  end
end
