class TripsController < ApplicationController

  def new
    session[:trip_id] = nil
    @trip = Trip.new
  end

  def create
    trip = Trip.new(permitted_params)
    trip.update(params)
    trip.ending_duration = trip.original_duration
    if trip.save
      session[:trip_id] = trip.id
      redirect_to(trip)
    else
      redirect_to root_path
    end
  end

  # Nested conditionals are the devil, but test coverage is sweet, and you have
  # some for this method. You have four failing tests on this method if the code
  # is deleted. I reviewed the tests, and like them, but think that two tests
  # could include a subject.
  def show
    if params[:id].to_i == session[:trip_id]
      @trip = Trip.find(params[:id])
      if @trip.errands.empty?
        @trip_duration = @trip.original_duration
      else
        @trip_duration = @trip.ending_duration
      end
    else
      redirect_to root_path
    end
  end

  def finalize
    trip = Trip.find(session[:trip_id])
    trip.update_attributes(url: ShortenedLink.generate_random_string)
    trip.update_attributes(ending_duration: trip.original_duration) if trip.ending_duration == 0
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

