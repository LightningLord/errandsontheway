class TripsController < ApplicationController

  def new
    session[:trip_id] = nil
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(permitted_params)
    @trip.ending_duration = @trip.original_duration
    @trip.update(params)
    if @trip.save
      session[:trip_id] = @trip.id
      redirect_to(@trip)
    else
      render :new
    end
  end

  def show
    @trip = Trip.find(params[:id])
    if @trip.errands.empty?
      @trip_duration = @trip.original_duration
    else
      @trip_duration = @trip.ending_duration
    end
  end

  def finalize
    trip = Trip.find(session[:trip_id])
    trip.update_attributes(url: SecureRandom.hex)
    redirect_to trip_summary_path(trip.url)
  end

  def summary
    @trip = Trip.find_by_url(params[:url])
  end

  private

  def permitted_params
    params.require(:trip).permit(:start_point_address, :end_point_address)
  end


end

