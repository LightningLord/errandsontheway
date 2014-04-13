require 'spec_helper'

describe ErrandsController do
  describe '#create' do
    let(:new_trip){ FactoryGirl.create(:valid_trip) }
    let(:create_errand){ post :create, errand: FactoryGirl.attributes_for(:valid_errand)}
    before(:each){ request.session[:trip_id]= new_trip.id }
    it 'creates a new errand' do
      expect{ create_errand }.to change{ Errand.count}.by(1)
    end

    it 'increments trips ending duration properly' do
      new_errand = FactoryGirl.build(:valid_errand)
      original_duration = new_trip.original_duration
      create_errand
      expect(new_trip.reload.ending_duration).to eq(original_duration + new_errand.delta_duration)
    end
  end
end
