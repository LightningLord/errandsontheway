class Trip < ActiveRecord::Base
  has_many :errands
  validates :start_point_address, :end_point_address, presence: true 
  validates :start_point_latitude, :start_point_longitude, :end_point_latitude, :end_point_longitude, presence: {message: "Please enter valid start-point and end-point."}

  def set_coordinates(coordinates)
    start_coords = coordinates.first
    end_coords = coordinates.last
    self.start_point_latitude = start_coords.first
    self.start_point_longitude = start_coords.last
    self.end_point_latitude = end_coords.first
    self.end_point_longitude = end_coords.last
  end

end
