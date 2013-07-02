class Note < ActiveRecord::Base
  belongs_to :estimate

  auto_strip_attributes :text, :nullify => false, :squish => true

  validates :text, presence: true, length: { in: 2..400 }
  validates_associated :estimate
end
