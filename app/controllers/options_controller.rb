class OptionsController < ApplicationController
  def index
    @search_term = params[:search]
    # trip = Trip.find(session[:trip_id])
    # place = Place.new(trip.start_point_latitude.to_s, trip.start_point_longitude.to_s, @search_term)
    # p place
    # @businesses = place.get_names_and_addresses
    # # p "trip lat, long: #{trip.start_point_latitude}, #{trip.start_point_longitude}"
    # p "#{@businesses}"
  end

  private

end