class CoordinatesRetriever

  def self.get_coordinates(address)
    result = Geocoder.coordinates(address)
    result.nil? ? nil : result
  end
end