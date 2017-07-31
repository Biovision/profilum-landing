class Program < ApplicationRecord
  include Toggleable

  PER_PAGE    = 20
  NAME_LIMIT  = 255
  LEAD_LIMIT  = 255
  URL_LIMIT   = 255
  PRICE_RANGE = (0..16777215)

  toggleable :visible, :use_discount

  mount_uploader :image, ProgramImageUploader

  belongs_to :center, counter_cache: true
  has_many :program_age_groups, dependent: :destroy
  has_many :program_schools, dependent: :destroy
  has_many :age_groups, through: :program_age_groups
  has_many :schools, through: :program_schools

  validates_presence_of :name, :url
  validates_length_of :name, maximum: NAME_LIMIT
  validates_length_of :lead, maximum: LEAD_LIMIT
  validates_length_of :url, maximum: URL_LIMIT
  validates_inclusion_of :price, in: PRICE_RANGE
  validates_inclusion_of :old_price, in: PRICE_RANGE, allow_nil: true
  validate :old_price_should_be_meaningful

  scope :ordered_by_name, -> { order('name asc') }
  scope :ordered_by_price, -> { order('price asc, name asc') }
  scope :visible, -> { where(visible: true) }

  # @param [Integer] page
  def self.page_for_administration(page)
    ordered_by_name.page(page).per(PER_PAGE)
  end

  # @param [Integer] page
  def self.page_for_visitors(page = 1)
    visible.ordered_by_price.page(page).per(6)
  end

  def self.entity_parameters
    %i(center_id image name lead url price old_price visible use_discount)
  end

  # @param [Boolean] force
  def discount(force = false)
    return 0 if old_price.to_i < 1
    (use_discount? || force) ? (old_price - price) : 0
  end

  def ages
    age_groups.ordered_by_priority.map(&:name).join(' ')
  end

  private

  def old_price_should_be_meaningful
    return if old_price.to_i < 1
    error = I18n.t('activerecord.errors.models.programs.attributes.old_price.should_be_greater_than_price')
    if old_price <= price
      errors.add(:old_price, error)
    end
  end
end
