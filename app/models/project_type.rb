class ProjectType < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  belongs_to :user

  auto_strip_attributes :name, :description, :nullify => false, :squish => true

  validates :name, presence: true
  validates_associated :user
  validates :description, length: { maximum: 1000 }
end
