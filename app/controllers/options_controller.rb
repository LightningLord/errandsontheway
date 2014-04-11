class OptionsController < ApplicationController
  def index
    @search_term = params[:search]

  end
end