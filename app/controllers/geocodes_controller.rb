class GeocodesController < ApplicationController
  def convert
    results = GeocodeRetriever.get_address(params["coords"])
    render text: "#{results}"
  end
end 