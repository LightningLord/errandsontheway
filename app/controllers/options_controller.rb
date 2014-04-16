class OptionsController < ApplicationController
  def index
    if session[:trip_id]
      @search_term = params[:search]
      @trip = Trip.find(session[:trip_id])
      @businesses = prepare_businesses(@trip, @search_term)
      if @businesses.empty?
        flash[:alert] = "Sorry! No places found near your route. Please try another."
        # redirect_to(@trip)
        render :partial => "trips/search"
      else
        render :partial => "options"
      end
    else
      redirect_to root_path
    end
  end

  private

  def get_business_info_near_point(place, trip)
    businesses = create_businesses(place)
    businesses.each { |business| business.set_extra_duration(trip)}
    businesses
  end

  def create_businesses(place)
    place.get_biz_names_addresses_coordinates.map do |name_address_coord_hash|
      Business.new(name_address_coord_hash[:name], name_address_coord_hash[:address],
                  name_address_coord_hash[:latitude], name_address_coord_hash[:longitude])
    end
  end

  def prepare_businesses(trip, search_term)
    start_place = Place.new(trip.start_point_latitude.to_s, trip.start_point_longitude.to_s, search_term)
    end_place = Place.new(trip.end_point_latitude.to_s, trip.end_point_longitude.to_s, search_term)
    businesses = get_business_info_near_point(start_place, trip) + get_business_info_near_point(end_place, trip)
    businesses.sort{|a,b| a.extra_duration <=> b.extra_duration}
  end

end