class GeocodeRetriever

  def self.get_coordinates(address)
    location = Location.find_by_address(address)
    if location
      [location.latitude, location.longitude]
    else
      self.create_location_from_address(address)
    end
  end

  def self.get_address(coords)
    locations = Location.find_by_lat_long(coords.first, coords.last)
    if locations.empty?
      self.create_location_from_coords(coords)
    else
      locations.first.address
    end
  end

  private
  def self.create_location_from_address(address)
    coords = Geocoder.coordinates(address)
    Location.create({
      address: address,
      latitude: coords.first,
      longitude: coords.last
      })
    coords
  end

  def self.create_location_from_coords(coords)
    address = Geocoder.address(coords)
    Location.create({
      address: address,
      latitude: coords.first,
      longitude: coords.last
      })
    address
  end



end






