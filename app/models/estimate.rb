class Estimate < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  has_many :notes, dependent: :destroy
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_and_belongs_to_many :editors, class_name: "User"

  # accepts_nested_attributes_for :editors

  auto_strip_attributes :project, :description, nullify: false, squish: true

  validates :project, presence: true
  validates_associated :user
  validates :project, length: { in: 2..60 }

  def total_cost
    self.tasks.map { |t| t.hours * t.rate }.sum
  end

  def total_hours
    self.tasks.map { |t| t.hours }.sum
  end
end
