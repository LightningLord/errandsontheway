class Business
  attr_reader :name, :address, :extra_duration

  def initialize(name, address)
    @address = address
    @name = name
    @extra_duration = 0
  end



  def get_directions(trip)
    trip_info = {origin: trip.start_point_address, destination: trip.end_point_address,
      waypoints: trip.waypoints_list(@address), travel_mode: trip.travel_mode}
    set_extra_duration(DirectionsServiceHelper.new(trip_info).calculate_total_duration, trip.original_duration)
  end
# private
  def set_extra_duration(duration_with_business, original_trip_duration)
    @extra_duration = duration_with_business - original_trip_duration
    @extra_duration = 0 if @extra_duration < 0
  end





end