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
    businesses.each do |business|
      waypoints_list = [business.address]
      waypoints_list += trip.errands.map{|errand| errand.address} unless trip.errands.empty?
      trip_info = {origin: trip.start_point_address, destination: trip.end_point_address, waypoints: waypoints_list, travel_mode: trip.travel_mode}
      business.set_extra_duration(DirectionsServiceHelper.new(trip_info).calculate_total_duration, trip.original_duration)
    end
    businesses
  end

  def create_businesses(place)
    place.get_names_and_addresses.map { |name_address_hash| Business.new(name_address_hash[:name], name_address_hash[:address])}
  end


end