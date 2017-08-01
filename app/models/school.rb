class School < ApplicationRecord
  include RequiredUniqueName
  include RequiredUniqueSlug
  include Toggleable

  PER_PAGE = 20

  SLUG_PATTERN = /\A[a-z0-9]+[-a-z0-9_]{,248}[a-z0-9]+\z/
  SLUG_LIMIT   = 250
  NAME_LIMIT   = 250

  toggleable :visible

  has_many :program_schools, dependent: :destroy
  has_many :programs, through: :program_schools

  validates_format_of :slug, with: SLUG_PATTERN
  validates_length_of :name, maximum: NAME_LIMIT

  before_validation { self.slug = Canonizer.transliterate(name.to_s) if slug.blank? }

  scope :visible, -> { where(visible: true) }
  scope :with_programs, -> { where('programs_count > 0') }

  # @param [Integer] page
  def self.page_for_administration(page = 1)
    ordered_by_name.page(page).per(PER_PAGE)
  end

  def self.list_for_visitors
    visible.with_programs.ordered_by_name
  end

  def self.entity_parameters
    %i(name slug visible)
  end

  # @param [Program] program
  def has_program?(program)
    program_schools.where(program: program).exists?
  end
end
