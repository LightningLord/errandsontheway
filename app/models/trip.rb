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

  def add_api_info(params)
    start_coords = call_coordinates_retriever(params[:start_point_address])
    end_coords = call_coordinates_retriever(params[:end_point_address])
    if start_coords && end_coords
      self.set_coordinates(start_coords, end_coords)
      self.original_duration = call_distance_matrix_helper
    end
  end

  def set_duration(delta_duration)
    self.ending_duration += delta_duration
    self.save
  end

  def reached_max_errands?
    errands.length >= max_errand_limit
  end

  def max_errand_limit
    5
  end

  def waypoints_list(business_address)
    list = [business_address]
    waypoints_list += self.errands.map{|errand| errand.address} unless self.errands.empty?
    list
  end

  private

  def call_coordinates_retriever(address)
    GeocodeRetriever.get_coordinates(address)
  end

  def call_distance_matrix_helper
    DistanceMatrixHelper.new({origins: self.start_point_address, destinations: self.end_point_address, travel_mode: self.travel_mode}).get_trip_duration
  end

end
