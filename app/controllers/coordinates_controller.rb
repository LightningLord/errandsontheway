class CoordinatesController < ApplicationController
  def convert
    results = CoordinatesRetriever.get_address(params["coords"])
    render text: "#{results}"
  end
end 