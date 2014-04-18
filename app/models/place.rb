class Place
  def initialize(latitude, longitude, keyword)
    @client = GooglePlaces::Client.new(ENV["API_KEY"])
    @latitude = latitude
    @longitude = longitude
    @keyword = keyword
    @request_businesses = self.class.request_businesses(latitude, longitude, keyword)
  end
  #latitude and longitude are passed in as strings with many decimals
  #ie '-33.8670522'

  def get_biz_names_addresses_coordinates
    @request_businesses.shift(2).map{|business|
      {name: business["name"], address: business["vicinity"],
        latitude: business["geometry"]["location"]["lat"],
        longitude: business["geometry"]["location"]["lng"]}}
  end

  private

  def client
    @client
  end

  def self.request_businesses(latitude, longitude, keyword)
    location = GooglePlaces::Location.new(latitude, longitude).format
    response = GooglePlaces::Request.spots(
      :location => location,
      :rankby => 'distance',
      :sensor => false,
      :keyword => keyword,
      :opennow => true,
      :key => ENV["API_KEY"]
      )
    response['results']
  end

end



