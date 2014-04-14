class DirectionsServiceHelper
  include HTTParty

  base_uri 'https://maps.googleapis.com'
  def initialize(args)
      @options = { query: { origin: args[:origin],
                            destination: args[:destination],
                            waypoints: "optimize:true|" + args[:waypoints].join(" | "),
                            sensor: false,
                            mode: args[:travel_mode].downcase,
                            key: ENV['API_KEY']
                          }
                  }
  end


  def calculate_total_duration
    api_request["routes"].first["legs"].map{ |leg| leg["duration"]["value"]}.reduce(:+)
  end


  private
  def api_request
    self.class.get('/maps/api/directions/json', @options).parsed_response
  end



end

