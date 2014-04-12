class TripsController < ApplicationController

  def new
    @trip = Trip.new
  end
  
  def show
  end


  def create
    @trip = Trip.new(permitted_params)
    coordinates = CoordinatesRetriever.get_coordinates(params[:trip][:start_point_address], params[:trip][:end_point_address])
    @trip.set_coordinates(coordinates) if coordinates
    if @trip.save
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

