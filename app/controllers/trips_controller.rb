class TripsController < ApplicationController

  def new
    @trip = Trip.new
  end
  def show
  end


  def create
    @trip = Trip.new(permitted_params)
    if @trip.save
      redirect_to(@trip)
    end
  end




  private

  def permitted_params
    params.require(:trip).permit(:start_point_address, :end_point_address)
  end

end
