class CoordinatesRetriever

  def self.get_coordinates(address)
    Geocoder.coordinates(address)
  end
end