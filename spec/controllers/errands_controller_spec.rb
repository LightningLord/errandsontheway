require 'spec_helper'

describe ErrandsController do
  describe '#create' do
    let(:new_trip){ FactoryGirl.create(:valid_trip) }
    let(:create_errand){ post :create, errand: FactoryGirl.attributes_for(:valid_errand)}

    it 'creates a new errand' do
      request.session[:trip_id]= new_trip.id
      expect{ create_errand }.to change{ Errand.count}.by(1)
    end
  end
end
