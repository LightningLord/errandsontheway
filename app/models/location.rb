class Location < ActiveRecord::Base
  validates :address, :latitude, :longitude, presence: true
end