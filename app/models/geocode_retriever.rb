class GeocodeRetriever

  def self.get_coordinates(address)
    location = Location.find_by_address(address)
    if location
      [location.latitude, location.longitude]
    else
      self.create_location(address)
    end
  end

  def self.get_address(coords)
    Geocoder.address(coords)
  end

  private
  def self.create_location(address)
    coords = Geocoder.coordinates(address)
    Location.create({
      address: address,
      latitude: coords.first,
      longitude: coords.last
      })
    coords
  end


end






