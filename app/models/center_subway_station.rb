class CenterSubwayStation < ApplicationRecord
  belongs_to :center
  belongs_to :subway_station, counter_cache: :center_count

  validates_uniqueness_of :subway_station_id, scope: [:center_id]
end
