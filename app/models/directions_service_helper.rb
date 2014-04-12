class DirectionsServiceHelper
  include HTTParty

# maps.googleapis.com/maps/api/directions/json
# origin=Boston,MA&
# destination=Concord,MA&
# waypoints=Charlestown,MA|Lexington,MA&
# sensor=false&
# key=API_KEY
  base_uri 'https://maps.googleapis.com'
  def initialize(args)
    @options = { query: { origin: args[:origin],
                          destination: args[:destination],
                          waypoints: args[:waypoints].join(" | "),
                          sensor: false,
                          key: ENV['API_KEY']
                        }
                }
  end


  def calculate_total_duration
    api_request.parsed_response["routes"].first["legs"].map{ |leg| leg["duration"]["value"]}.reduce(:+)
  end

  private

  def api_request
    self.class.get('/maps/api/directions/json', @options)
  end



end

# response.parsed_response["routes"].first["legs"]
 # response.parsed_response["routes"].first["legs"].first["duration"]
# :waypoints=>["85 W 5th Ave, San Mateo, CA", "1035 Northwood Drive, San Carlos, CA"]
 # :waypoints=>"85 W 5th Ave, San Mateo, CA | 1035 Northwood Drive, San Carlos, CA", :sensor=>false, :key=>"AIzaSyAAPig8eebUk6Vj79Fgd275gDQfOvFqYnU"}}