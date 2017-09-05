class AgeGroup < ApplicationRecord
  include RequiredUniqueName

  NAME_LIMIT     = 10
  PRIORITY_RANGE = (1..32767)

  has_many :program_age_groups, dependent: :destroy
  has_many :programs, through: :program_age_groups

  after_initialize :set_next_priority

  before_validation :normalize_priority

  validates_length_of :name, maximum: NAME_LIMIT

  scope :ordered_by_priority, -> { order('priority asc, name asc') }
  scope :with_programs, -> { joins(:program_age_groups).where(program_age_groups: { program_id: Program.visible.pluck(:id) }) }

  def self.page_for_administration
    ordered_by_priority
  end

  def self.list_for_visitors
    with_programs.ordered_by_priority.uniq
  end

  def self.entity_parameters
    %i(name)
  end

  # @param [Program] program
  def has_program?(program)
    program_age_groups.where(program: program).exists?
  end

  private

  def set_next_priority
    if id.nil? && priority == 1
      self.priority = self.class.maximum(:priority).to_i + 1
    end
  end

  def normalize_priority
    self.priority = PRIORITY_RANGE.first if priority < PRIORITY_RANGE.first
    self.priority = PRIORITY_RANGE.last if priority > PRIORITY_RANGE.last
  end
end
