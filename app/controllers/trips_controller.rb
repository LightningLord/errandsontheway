class TripsController < ApplicationController
  
  def new
    @new = Trip.new
  end

  def show
    @trip = Trip.find(params[:id])
  end

end