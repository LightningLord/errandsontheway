class ErrandsController < ApplicationController
  def create
    p "session id #{session[:trip_id]}"
    trip = Trip.find_by_id(session[:trip_id])
    errand = trip.errands.build(permitted_params)

    coords = CoordinatesRetriever.get_coordinates(params[:errand][:address])

    errand.set_coordinates(coords) if coords

    if errand.save
      flash[:notice] = "Your errand has been saved!"
      redirect_to(trip)
    else
      flash[:error] = "Error: could not save this errand"
      redirect_to(trip)
    end
  end

  private
  def permitted_params
    params.require(:errand).permit(:business_name,
                                   :address,
                                   :additional_duration)
  end
end