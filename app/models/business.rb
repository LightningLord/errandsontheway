class Business
  attr_reader :name, :address
  attr_accessor :extra_duration

  def initialize(name, address, latitude, longitude)
    @address = address
    @name = name
    @latitude = latitude
    @longitude = longitude
  end

  def calculate_delta_duration(duration_with_business, original_trip_duration)
    duration_with_business - original_trip_duration
  end

end