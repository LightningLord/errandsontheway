class TripsController < ApplicationController
  
  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(permitted_params)
    coordinates = CoordinatesRetriever.get_coordinates(@trip)
    @trip.set_coordinates(coordinates)
    if @trip.save
      redirect_to(@trip)
    else 
      render :new
    end
      
  end

  def show
    # @trip = Trip.find(params[:id])
  end


  private

  def permitted_params
    params.require(:trip).permit(:start_point_address, :end_point_address)
  end

end