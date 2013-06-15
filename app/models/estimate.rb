class Estimate < ActiveRecord::Base
  has_many :tasks, :dependant => :destroy
end
