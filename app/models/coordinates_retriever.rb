class CoordinatesRetriever

  def self.get_coordinates(address)
    location = Location.find_by_address(address)
    if location
      p "location found!"
      [location.latitude, location.longitude]
    else
      self.create_location(address)
      p "location created!"
    end
  end

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