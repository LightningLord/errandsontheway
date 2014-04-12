class Business
  attr_reader :name, :address
  attr_accessor :extra_duration

  def initialize(name, address)
    @address = address
    @name = name
  end

  def calculate_delta_duration(duration_with_business, original_trip_duration)
    duration_with_business - original_trip_duration
  end

  def format_delta_duration(duration_with_business, original_trip_duration)
    "#{calculate_delta_duration(duration_with_business, original_trip_duration) / 60 } minutes"

  end

end