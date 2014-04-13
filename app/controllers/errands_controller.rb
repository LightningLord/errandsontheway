class ErrandsController < ApplicationController
  def create
    trip = Trip.find_by_id(session[:trip_id])
    errand = trip.errands.build(permitted_params)
    coords = CoordinatesRetriever.get_coordinates(params[:errand][:address])
    errand.set_coordinates(coords) if coords
    set_duration(trip, errand.delta_duration)
    errand.save
    flash[:notice] = "Your errand has been saved!"
    redirect_to(trip)
  end

  private
  def permitted_params
    params.require(:errand).permit(:business_name,
                                   :address,
                                   :delta_duration)
  end

  def set_duration(trip, delta_duration)
    trip.ending_duration += delta_duration
    trip.save
  end

end
