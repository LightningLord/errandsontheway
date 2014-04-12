class DistanceMatrixHelper
  include HTTParty
# /maps/api/distancematrix/json
# https://maps.googleapis.com/maps/api/distancematrix/json
#   origins=Vancouver+BC&
#   destinations=San+Francisco
#   sensor=false&
#   key=AIzaSyAAPig8eebUk6Vj79Fgd275gDQfOvFqYnU
  base_uri 'https://maps.googleapis.com'
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


