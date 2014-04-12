class CoordinatesRetriever 

  def self.get_coordinates(start_address, end_address)
    start_result = Geocoder.coordinates(start_address)
    end_result = Geocoder.coordinates(end_address)
    if start_result.nil? || end_result.nil?
      nil
    else
      [start_result, end_result]
    end
  end
end