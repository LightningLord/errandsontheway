class OptionsController < ApplicationController
  def index
    if session[:trip_id]
      @search_term = params[:search]
      trip = Trip.find(session[:trip_id])
      start_place = Place.new(trip.start_point_latitude.to_s, trip.start_point_longitude.to_s, @search_term)
      end_place = Place.new(trip.end_point_latitude.to_s, trip.end_point_longitude.to_s, @search_term)
      @start_businesses = get_business_info_near_point(start_place, trip)
      @end_businesses = get_business_info_near_point(end_place, trip)
      render :partial => "options"
    else
      redirect_to root_path
    end
  end



  private

  def get_business_info_near_point(place, trip)
    businesses = create_businesses(place)
    businesses.each { |business| business.set_directions(trip)}
    businesses
  end

  def create_businesses(place)
    place.get_names_and_addresses.map { |name_address_hash| Business.new(name_address_hash[:name], name_address_hash[:address])}
  end


end