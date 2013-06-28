class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :estimates, dependent: :destroy
  has_many :project_types, dependent: :destroy
  validates_uniqueness_of :email, case_sensitive: false
end
