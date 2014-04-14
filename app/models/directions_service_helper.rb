# This name is inaccurate, this is not a helper in the Rails sense.
class DirectionsServiceHelper
  include HTTParty

  base_uri 'https://maps.googleapis.com'
  def initialize(args)
      @options = { query: { origin: args[:origin],
                            destination: args[:destination],
                            waypoints: "optimize:true|" + args[:waypoints].join(" | "),
                            sensor: false,

                            key: ENV['API_KEY']
                          }
                  }
  end

  # There's a lot of knowledge of your data structure in here, but not a lot of
  # description as to how the total duration calculation happens. alias
  # `api_request["routes"].first["legs"]` into a first_route method, maybe?
  def calculate_total_duration
    api_request["routes"].first["legs"].map{ |leg| leg["duration"]["value"]}.reduce(:+)
  end


  private
  def api_request
    self.class.get('/maps/api/directions/json', @options).parsed_response
  end



end

