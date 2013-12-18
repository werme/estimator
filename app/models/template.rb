class Template < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  belongs_to :author, class_name: "User", foreign_key: "author_id"

  auto_strip_attributes :name, :description, :nullify => false, :squish => true

  validates :name, presence: true
  validates_associated :author
  validates :description, length: { maximum: 1000 }
end
