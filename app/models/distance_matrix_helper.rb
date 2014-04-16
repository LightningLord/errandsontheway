class DistanceMatrixHelper
  include HTTParty

  base_uri 'https://maps.googleapis.com'

  def initialize(args)
    @options = { query: { origins: args[:origins],
                          destinations: args[:destinations],
                          sensor: false,
                          mode: args[:travel_mode],
                          key: ENV["API_KEY"] } }
  end

  def get_trip_duration
    self.class.make_api_call(@options)["rows"].first["elements"].first["duration"]["value"]
  end

  private

  def self.make_api_call(options)
    self.get("/maps/api/distancematrix/json", options).parsed_response
  end




end




