class ErrandsController < ApplicationController
  # No tests fail on your applications third most complicated method when I
  # delete the code. This is troubling, but I see its coverage is handled in VCR
  # tests. Digging into the issue I noticed that my vcr_cassettes folder gives a
  # "You have exceeded your daily request quota for this API." in the
  # errand_controller_spec.yml, which makes me think this cassette was generated
  # on my machine. Feel free to commit cassettes when they've successfully been
  # generated, but also stub out your params and sessions enough that you can
  # create an errand without the cassette.
  def create
    trip = Trip.find(session[:trip_id])
    errand = trip.errands.build(permitted_params)
    coords = CoordinatesRetriever.get_coordinates(params[:errand][:address])
    errand.set_coordinates(coords) if coords
    trip.set_duration(errand.delta_duration)
    if errand.save
      flash[:notice] = "Your errand has been added!"
    else
      flash[:alert] = "There was a problem saving this errand. Please choose a different business."
    end
    redirect_to(trip)
  end

  private
  def permitted_params
    params.require(:errand).permit(:business_name,
                                   :address,
                                   :delta_duration)
  end
end
