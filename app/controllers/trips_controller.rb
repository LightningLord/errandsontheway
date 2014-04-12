class TripsController < ApplicationController

  def show
  end

  def new
    session[:trip_id] = nil
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(permitted_params)

    start_coords = CoordinatesRetriever.get_coordinates(params[:trip][:start_point_address])
    end_coords = CoordinatesRetriever.get_coordinates(params[:trip][:end_point_address])
    @trip.set_coordinates(start_coords, end_coords) if start_coords && end_coords

    if @trip.save
      session[:trip_id] = @trip.id
      redirect_to(@trip)
    else
      render :new
    end
  end

  private

  def permitted_params
    params.require(:trip).permit(:start_point_address, :end_point_address)
  end

end

