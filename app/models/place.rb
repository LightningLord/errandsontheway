class Place
  def initialize
    @client = GooglePlaces::Client.new(ENV["API_KEY"])
  end



  private

  def client
    @client
  end

end