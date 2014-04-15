class OptionsController < ApplicationController
  def index
    if session[:trip_id]
      @search_term = params[:search]
      @trip = Trip.find(session[:trip_id])
      start_place = Place.new(@trip.start_point_latitude.to_s, @trip.start_point_longitude.to_s, @search_term)
      end_place = Place.new(@trip.end_point_latitude.to_s, @trip.end_point_longitude.to_s, @search_term)
      p @start_businesses = get_business_info_near_point(start_place, @trip)
      p @end_businesses = get_business_info_near_point(end_place, @trip)
      p @options = @start_businesses + @end_businesses
      render :partial => "options"
    else
      redirect_to root_path
    end
  end

  private

  def get_business_info_near_point(place, trip)
    p businesses = place.get_biz_names_addresses_coordinates.map { |name_address_coord_hash| Business.new(name_address_coord_hash[:name], name_address_coord_hash[:address], name_address_coord_hash[:latitude], name_address_coord_hash[:longitude])}
    businesses.each do |business|
      waypoints_list = [business.address]
      waypoints_list += trip.errands.map{|errand| errand.address} unless trip.errands.empty?
      trip_info = {origin: trip.start_point_address, destination: trip.end_point_address, waypoints: waypoints_list, travel_mode: trip.travel_mode}
      business.extra_duration = business.calculate_delta_duration(DirectionsServiceHelper.new(trip_info).calculate_total_duration, trip.original_duration)
      business.extra_duration = 0 if business.extra_duration < 0
    end
    return businesses
  end


end