class Estimate < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  has_many :notes, dependent: :destroy
  belongs_to :user
  has_and_belongs_to_many :editors, class_name: "User"

  # accepts_nested_attributes_for :editors

  auto_strip_attributes :project, :description, :nullify => false, :squish => true

  validates :project, presence: true
  validates_associated :user
  validates :project, length: { in: 2..60 }
end
