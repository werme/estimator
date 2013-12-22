class Task < ActiveRecord::Base
  belongs_to :estimate
  belongs_to :template
  belongs_to :parent, class_name: "Task", foreign_key: "parent_id"
  has_many :subtasks, class_name: "Task", foreign_key: "parent_id", dependent: :destroy

  auto_strip_attributes :name, nullify: false, squish: true

  validates :name, presence: true
  validates :hours, numericality: { only_integer: true }
  validates :rate, numericality: { only_integer: true }

  delegate :author, to: :project, prefix: false

  amoeba do
    nullify :template_id
  end

  def project
    if self.parent
      self.parent.project 
    else
      self.estimate || self.template
    end
  end

  def hours
    unless self.subtasks.empty?
      self.subtasks.map(&:hours).inject(0,:+)
    else
      self.read_attribute(:hours)
    end
  end

  def total
    self.hours * self.rate
  end
end
