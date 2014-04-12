require 'spec_helper'

describe OptionsController do
  describe '#index' do
    let(:new_trip){FactoryGirl.create(:valid_trip)}
    it 'assigns a search term based on params' do
      request.session[:trip_id] = new_trip.id
      get :index, :search => "Tacos"
      expect(assigns(:search_term)).to eq('Tacos')
    end

  end
end
