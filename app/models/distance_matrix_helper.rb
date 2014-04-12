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

  def distance_matrix
    self.class.get("/maps/api/distancematrix/json", @options)
  end




end

# response.parsed_response
# response.parsed_response["rows"].first["elements"].first["duration"]
# seconds = response.parsed_response["rows"].first["elements"].first["duration"]["value"]
#returns an integer number of seconds

