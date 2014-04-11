class Place
  def initialize
    @client = GooglePlaces::Client.new(ENV["API_KEY"])
  end
  #latitude and longitude are passed in as strings with many decimals
  #ie '-33.8670522'
  def request(latitude, longitude, keyword)
    location = GooglePlaces::Location.new(latitude, longitude).format
    response = GooglePlaces::Request.spots(
      :location => location,
      :radius => 200,
      :sensor => false,
      :keyword => keyword,
      :key => ENV["API_KEY"]
      )
    response['results']
  end

  private

  def client
    @client
  end
end





# https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=500&types=food&name=harbour&sensor=false&key=AIzaSyAAPig8eebUk6Vj79Fgd275gDQfOvFqYnU
