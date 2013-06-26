class Task < ActiveRecord::Base
  belongs_to :estimate
  belongs_to :project_type
  belongs_to :parent, class_name: "Task", foreign_key: "parent_id"
  has_many :tasks, foreign_key: "parent_id", dependent: :destroy
end
