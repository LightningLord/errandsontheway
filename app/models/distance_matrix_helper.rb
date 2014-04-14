class DistanceMatrixHelper
  include HTTParty

  base_uri 'https://maps.googleapis.com'
  #enter in origins and destinations as addresses

  def initialize(args)
    @options = { query: { origins: args[:origins],
                          destinations: args[:destinations] ,
                          sensor: false,
                          key: ENV["API_KEY"] } }
  end

  # This seems to be doing the same thing or a similar thing as
  # DirectionsServiceHelper#calculate_total_duration. Is there a missing object
  # here?
  def get_trip_duration
    make_api_call["rows"].first["elements"].first["duration"]["value"]
  end

  private

  def make_api_call
    self.class.get("/maps/api/distancematrix/json", @options).parsed_response
  end




end




