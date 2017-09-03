class SubwayStation < ApplicationRecord
  NAME_LIMIT   = 150
  SLUG_LIMIT   = 150
  SLUG_PATTERN = /\A[a-z0-9]+[-a-z0-9_]{,248}[a-z0-9]+\z/

  belongs_to :subway_line, optional: true
  has_many :center_subway_stations, dependent: :delete_all
  has_many :centers, through: :center_subway_stations

  before_validation { self.slug = Canonizer.transliterate(name.to_s) if slug.nil? }
  validates_length_of :name, maximum: NAME_LIMIT
  validates_length_of :slug, maximum: SLUG_LIMIT
  validates_format_of :slug, with: SLUG_PATTERN, allow_blank: true

  scope :ordered_by_name, -> { order('name asc') }

  def self.list_for_visitors
    center_ids = Center.with_programs.pluck(:id)
    criteria   = { center_subway_stations: { center_id: center_ids } }
    ordered_by_name.joins(:center_subway_stations).where(criteria).uniq
  end

  def has_center?(center)
    CenterSubwayStation.exists?(center: center, subway_station: self)
  end
end
