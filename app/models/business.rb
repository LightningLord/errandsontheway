class Business
  attr_reader :name, :address, :extra_duration

  def initialize(name, address)
    @address = address
    @name = name
    @extra_duration = 0
  end


  def set_extra_duration(duration_with_business, original_trip_duration)
    @extra_duration = duration_with_business - original_trip_duration
    @extra_duration = 0 if @extra_duration < 0
  end

end