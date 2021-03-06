class Center < ApplicationRecord
  include RequiredUniqueName

  PER_PAGE = 20

  NAME_LIMIT   = 255
  SLUG_LIMIT   = 255
  PLACE_LIMIT  = 255
  URL_LIMIT    = 255
  SLUG_PATTERN = /\A[a-z0-9]+[-a-z0-9_]{,248}[a-z0-9]+\z/

  LATITUDE_RANGE  = (-90..90)
  LONGITUDE_RANGE = (-180..180)

  mount_uploader :image, CenterImageUploader

  has_many :programs, dependent: :destroy
  has_many :center_subway_stations, dependent: :destroy
  has_many :subway_stations, through: :center_subway_stations

  validates_presence_of :url
  validates_length_of :name, maximum: NAME_LIMIT
  validates_length_of :place, maximum: PLACE_LIMIT
  validates_length_of :slug, maximum: SLUG_LIMIT
  validates_format_of :slug, with: SLUG_PATTERN, allow_blank: true
  validates_length_of :url, maximum: URL_LIMIT
  validates_inclusion_of :latitude, in: LATITUDE_RANGE, allow_nil: true
  validates_inclusion_of :longitude, in: LONGITUDE_RANGE, allow_nil: true

  scope :with_programs, -> { joins(:programs).where(programs: { visible: true }) }
  scope :near_stations, ->(ids) { joins(:center_subway_stations).where(center_subway_stations: { subway_station_id: ids }) unless ids.blank? }

  # @param [Integer] page
  def self.page_for_administration(page = 1)
    ordered_by_name.page(page).per(PER_PAGE)
  end

  def self.list_for_visitors
    with_programs.ordered_by_name.uniq
  end

  def self.entity_parameters
    %i(name slug url place image latitude longitude)
  end

  def subway
    subway_stations.ordered_by_name.map(&:name).join(', ')
  end

  def coordinates
    return '' if latitude.nil? || longitude.nil?
    "#{latitude};#{longitude}"
  end
end
