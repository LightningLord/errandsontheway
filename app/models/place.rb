class Place
  def initialize(latitude, longitude, keyword)
    @client = GooglePlaces::Client.new(ENV["API_KEY"])
    @latitude = latitude
    @longitude = longitude
    @keyword = keyword
  end
  #latitude and longitude are passed in as strings with many decimals
  #ie '-33.8670522'
  def request_businesses
    location = GooglePlaces::Location.new(@latitude, @longitude).format
    response = GooglePlaces::Request.spots(
      :location => location,
      :radius => 200,
      :sensor => false,
      :keyword => @keyword,
      :key => ENV["API_KEY"]
      )
    response['results']
  end

  def get_names
    request_businesses.map{|business| business["name"]}
  end

  def get_addresses
    request_businesses.map{|business| business["vicinity"]}
  end

  private

  def client
    @client
  end
end





# https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=500&types=food&name=harbour&sensor=false&key=AIzaSyAAPig8eebUk6Vj79Fgd275gDQfOvFqYnU
