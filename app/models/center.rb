class Center < ApplicationRecord
  include RequiredUniqueName

  PER_PAGE = 20

  NAME_LIMIT  = 255
  PLACE_LIMIT = 255
  URL_LIMIT   = 255

  has_many :programs, dependent: :destroy

  validates_presence_of :url, :place
  validates_length_of :name, maximum: NAME_LIMIT
  validates_length_of :place, maximum: PLACE_LIMIT
  validates_length_of :url, maximum: URL_LIMIT

  # @param [Integer] page
  def self.page_for_administration(page = 1)
    ordered_by_name.page(page).per(PER_PAGE)
  end

  def self.entity_parameters
    %i(name url place)
  end
end
