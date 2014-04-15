class Location < ActiveRecord::Base
  validates :address, :latitude, :longitude, presence: true
  scope :find_by_lat_long, ->(lat, long) {
    where(["latitude = :latitude and longitude = :longitude", { latitude: lat, longitude: long}])
  }
end