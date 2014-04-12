class OptionsController < ApplicationController
  def index
    @search_term = params[:search]
    trip = Trip.find(session[:trip_id])
    start_place = Place.new(trip.start_point_latitude.to_s, trip.start_point_longitude.to_s, @search_term)
    # end_place = Place.new(trip.end_point_latitude.to_s, trip.end_point_longitude.to_s, @search_term)
    @businesses = start_place.get_names_and_addresses.map do |name_address_hash|
      Business.new(name_address_hash[:name], name_address_hash[:address])
    end
    @businesses.each do |business|
      waypoints_list = [business.address]
      unless trip.errands.empty?
        waypoints_list += trip.errands.map{|errand| errand.address}
      end
      trip_info = {origin: trip.start_point_address, destination: trip.end_point_address, waypoints: waypoints_list}
      business.extra_duration = business.format_delta_duration(DirectionsServiceHelper.new(trip_info).calculate_total_duration, trip.original_duration)
    end


  end


end