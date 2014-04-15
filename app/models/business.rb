class Business
  attr_reader :name, :address, :extra_duration

  def initialize(name, address)
    @address = address
    @name = name
    @extra_duration = 0
  end



  def set_directions(trip)
    set_extra_duration(get_new_trip_duration(trip), trip.original_duration)
  end

  private

  def get_new_trip_duration(trip)
    DirectionsServiceHelper.new(trip.trip_info(@address)).calculate_total_duration
  end

  def set_extra_duration(duration_with_business, original_trip_duration)
    @extra_duration = duration_with_business - original_trip_duration
    @extra_duration = 0 if @extra_duration < 0
  end





end