class Center < ApplicationRecord
  include RequiredUniqueName

  PER_PAGE = 20

  NAME_LIMIT  = 255
  SLUG_LIMIT  = 255
  PLACE_LIMIT = 255
  URL_LIMIT   = 255

  mount_uploader :image, CenterImageUploader

  has_many :programs, dependent: :destroy
  has_many :center_subway_stations, dependent: :destroy
  has_many :subway_stations, through: :center_subway_stations

  validates_presence_of :url, :place
  validates_length_of :name, maximum: NAME_LIMIT
  validates_length_of :slug, maximum: SLUG_LIMIT
  validates_length_of :place, maximum: PLACE_LIMIT
  validates_length_of :url, maximum: URL_LIMIT

  # @param [Integer] page
  def self.page_for_administration(page = 1)
    ordered_by_name.page(page).per(PER_PAGE)
  end

  def self.entity_parameters
    %i(name slug url place image)
  end

  def subway
    subway_stations.ordered_by_name.map(&:name).join(', ')
  end
end
