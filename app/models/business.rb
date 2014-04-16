class Business
  attr_reader :name, :address, :extra_duration

  def initialize(name, address, latitude, longitude)
    @address = address
    @name = name
    @latitude = latitude
    @longitude = longitude
    @extra_duration = 0
  end

  def set_extra_duration(trip)
    calculate_extra_duration(get_new_trip_duration(trip), trip.original_duration)
  end

  private

  def get_new_trip_duration(trip)
    DirectionsRetriever.new(trip.trip_info(@address)).calculate_total_duration
  end

  def calculate_extra_duration(duration_with_business, original_trip_duration)
    @extra_duration = duration_with_business - original_trip_duration
    @extra_duration = 0 if @extra_duration < 0
  end

end