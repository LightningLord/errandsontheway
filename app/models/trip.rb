class Trip < ActiveRecord::Base
  has_many :errands
  validates :start_point_address, :end_point_address, :original_duration, presence: true
  validates :start_point_latitude, :start_point_longitude, :end_point_latitude, :end_point_longitude, presence: {message: "Please enter valid start-point and end-point."}
  validates :travel_mode, presence: {message: "Please select a travel mode."}

  def set_coordinates(start_coords, end_coords)
    self.start_point_latitude = start_coords.first
    self.start_point_longitude = start_coords.last
    self.end_point_latitude = end_coords.first
    self.end_point_longitude = end_coords.last
  end

  def format_ending_duration
    "#{(self.ending_duration / 60)} minutes"
  end

  def format_original_duration
    "#{(self.original_duration / 60)} minutes"
  end

  def update(params)
    start_coords = call_coordinates_retriever(params[:trip][:start_point_address])
    end_coords = call_coordinates_retriever(params[:trip][:end_point_address])
    if start_coords && end_coords
      self.set_coordinates(start_coords, end_coords)
      self.original_duration = call_distance_matrix_helper
    end
  end

  def set_duration(delta_duration)
    self.ending_duration += delta_duration
    self.save
  end

  private

  def call_coordinates_retriever(address)
    CoordinatesRetriever.get_coordinates(address)
  end

  def call_distance_matrix_helper
    DistanceMatrixHelper.new({origins: self.start_point_address, destinations: self.end_point_address}).get_trip_duration
  end

end
