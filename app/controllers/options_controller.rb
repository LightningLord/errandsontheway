class OptionsController < ApplicationController
  def index
    @search_term = params[:search]
    # @businesses = Place.new(args).get_names_and_addresses
  end

  private

end