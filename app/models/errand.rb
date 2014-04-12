class Errand < ActiveRecord::Base
  belongs_to :trip
  validates :business_name, :latitude, :longitude, :additional_duration, presence: true

  def set_coordinates(coords)
    self.latitude = coords.first
    self.longitude = coords.last
  end
end