class Estimate < ActiveRecord::Base
  has_many :tasks, :dependent => :destroy
end
