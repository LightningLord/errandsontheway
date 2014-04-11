class Trip < ActiveRecord::Base
  has_many :errands
  before_validation :geocode_all #, if: :start_point_address.present? and :end_point_address.present? 
  validates :start_point_address, :end_point_address, presence: true 
  validates :start_point_latitude, :start_point_longitude, :end_point_latitude, :end_point_longitude, presence: {message: "Please enter valid start-point and end-point."}

  def geocode_all
    start_result = Geocoder.coordinates(self.start_point_address)
    end_result = Geocoder.coordinates(self.end_point_address)
    self.start_point_latitude = start_result.first
    self.start_point_longitude = start_result.last
    self.end_point_latitude = end_result.first
    self.end_point_longitude = end_result.last
  end

end
