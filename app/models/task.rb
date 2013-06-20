class Task < ActiveRecord::Base
  belongs_to :estimate
  belongs_to :project_type
end
