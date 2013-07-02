class Task < ActiveRecord::Base
  belongs_to :estimate
  belongs_to :project_type
  belongs_to :parent, class_name: "Task", foreign_key: "parent_id"
  has_many :tasks, foreign_key: "parent_id", dependent: :destroy

  auto_strip_attributes :name, :nullify => false, :squish => true

  validates :name, presence: true
  validates :hours, numericality: { only_integer: true }
  validates :rate, numericality: { only_integer: true }
end
