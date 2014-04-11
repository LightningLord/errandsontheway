class TripsController < ApplicationController
  
  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(params[:trip])
  end

  def show
    # @trip = Trip.find(params[:id])
  end

end