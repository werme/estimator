class Estimate < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  has_many :notes, dependent: :destroy
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  belongs_to :template
  has_and_belongs_to_many :editors, class_name: "User"

  before_create :init

  auto_strip_attributes :project, :description, nullify: false, squish: true

  validates_associated :author
  validates :project, presence: true
  validates :project, length: { in: 2..60 }

  # Use author_name over author.name
  delegate :name, to: :author, prefix: true
  
  def cost
    self.tasks.map(&:total).inject(0,:+)
  end

  def hours
    self.tasks.map(&:hours).inject(0,:+)
  end

  def init
    # Bootstrap estimate from template if available
    bootstrap_estimate if self.template
  end

  def bootstrap_estimate
    template = Template.find(self.template)

    # Duplicate tasks and subtasks from template
    template.tasks.each do |t|
      self.tasks << t.amoeba_dup
    end

    # Set all task rates to the template default rate or zero
    self.tasks.each { |t| t.rate = template.default_rate || 0 }
  end
end
