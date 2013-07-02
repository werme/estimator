class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  auto_strip_attributes :name, :nullify => false, :squish => true

  has_many :estimates, dependent: :destroy
  has_many :project_types, dependent: :destroy
  has_and_belongs_to_many :accessed_estimates, class_name: "Estimate"

  validates_uniqueness_of :email, case_sensitive: false
  validates :name, length: { in: 2..60 }
end
