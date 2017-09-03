class SubwayLine < ApplicationRecord
  has_many :subway_stations, dependent: :destroy
end
