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
  scope :with_school_ids, ->(ids) { joins(:program_schools).where(program_schools: { school_id: ids }) unless ids.blank? }
  scope :with_age_group_ids, ->(ids) { joins(:program_age_groups).where(program_age_groups: { age_group_id: ids }) unless ids.blank? }
  scope :price_from, ->(value) { where('price >= ?', value.to_i) unless value.blank? }
  scope :price_to, ->(value) { where('price <= ?', value.to_i) unless value.blank? }
  scope :filtered, ->(f) { with_school_ids(f[:school]).with_age_group_ids(f[:age_group]).price_from(f[:price_from]).price_to(f[:price_to]) }

  # @param [Integer] page
  def self.page_for_administration(page)
    ordered_by_name.page(page).per(PER_PAGE)
  end

  # @param [Integer] page
  # @param [Hash] filter
  def self.page_for_visitors(page = 1, filter = {})
    filtered(filter).visible.ordered_by_price.distinct.page(page).per(6)
  end

  def self.entity_parameters
    %i(center_id image name lead url price old_price visible use_discount)
  end

  def self.prices
    min_price = visible.minimum(:price).to_i
    max_price = visible.maximum(:price).to_i
    (min_price..max_price)
  end

  # @param [Boolean] force
  def discount(force = false)
    return 0 if old_price.to_i < 1
    (use_discount? || force) ? (old_price - price) : 0
  end

  def discount_percent
    return 0 if old_price.to_i < 1

    ((1 - price.to_f/old_price.to_f) * 100).ceil.to_i
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
