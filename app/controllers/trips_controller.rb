class TripsController < ApplicationController
  
  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(permitted_params)
    p @trip
    if @trip.save
      redirect_to(@trip)
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