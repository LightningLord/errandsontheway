class CoordinatesRetriever 

  def self.get_coordinates(trip)
    start_result = Geocoder.coordinates(trip.start_point_address)
    end_result = Geocoder.coordinates(trip.end_point_address)
    return [start_result, end_result]
  end

end