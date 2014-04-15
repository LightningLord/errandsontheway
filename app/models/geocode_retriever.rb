class GeocodeRetriever

  def self.get_coordinates(address)
    Geocoder.coordinates(address)
  end

  def self.get_address(coords)
    Geocoder.address(coords)
  end
end