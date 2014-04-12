require 'spec_helper'

describe OptionsController do
  describe '#index' do
    let(:new_trip){FactoryGirl.create(:valid_trip)}

    before(:each) do
      request.session[:trip_id] = new_trip.id
      get :index, :search => "Tacos"
    end

    it 'assigns a search term based on params' do
      expect(assigns(:search_term)).to eq('Tacos')
    end

    it 'is successful' do
      expect(response).to render_template(:index)
    end

  end
end
