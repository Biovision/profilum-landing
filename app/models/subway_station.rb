class SubwayStation < ApplicationRecord
  belongs_to :subway_line, optional: true
  has_many :center_subway_stations, dependent: :destroy
  has_many :centers, through: :center_subway_stations

  before_save { self.slug = Canonizer.transliterate(name.to_s) if slug.nil? }

  scope :ordered_by_name, -> { order('name asc') }

  def has_center?(center)
    CenterSubwayStation.exists?(center: center, subway_station: self)
  end
end
