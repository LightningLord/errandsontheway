class OptionsController < ApplicationController
  # This is the most complicated action in your application with a flog score of
  # 29.1. However, when I comment out the code, only one test,
  # options_controller_spec "with no session it redirects" fails. I would expect
  # a corresponding test would cover the case of having a session. What should
  # the values of the search_term, trip, start_place, end_place, start_business,
  # and end_business be?
  def index
    if session[:trip_id]
      @search_term = params[:search]
      trip = Trip.find(session[:trip_id])
      start_place = Place.new(trip.start_point_latitude.to_s, trip.start_point_longitude.to_s, @search_term)
      end_place = Place.new(trip.end_point_latitude.to_s, trip.end_point_longitude.to_s, @search_term)
      @start_businesses = get_business_info_near_point(start_place, trip)
      @end_businesses = get_business_info_near_point(end_place, trip)
    else
      redirect_to root_path
    end
  end



  private

  def get_business_info_near_point(place, trip)
    businesses = place.get_names_and_addresses.map { |name_address_hash| Business.new(name_address_hash[:name], name_address_hash[:address])}
    businesses.each do |business|
      waypoints_list = [business.address]
      waypoints_list += trip.errands.map{|errand| errand.address} unless trip.errands.empty?
      trip_info = {origin: trip.start_point_address, destination: trip.end_point_address, waypoints: waypoints_list}
      business.extra_duration = business.calculate_delta_duration(DirectionsServiceHelper.new(trip_info).calculate_total_duration, trip.original_duration)
      business.extra_duration = 0 if business.extra_duration < 0
    end
    return businesses
  end


end