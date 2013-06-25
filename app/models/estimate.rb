class Estimate < ActiveRecord::Base
  has_many :tasks, :dependent => :destroy
  belongs_to :user
end
