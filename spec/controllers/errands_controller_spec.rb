require 'spec_helper'

describe ErrandsController do
  describe '#create' do
    let(:new_trip){ FactoryGirl.create(:valid_trip) }
    let(:create_errand){ post :create, errand: FactoryGirl.attributes_for(:valid_errand)}
    before(:each) do
      request.session[:trip_id] = new_trip.id
      # stub_return = {"routes" => [{"legs" => [{"duration" => {"value" => 50} }] }]}
      # DirectionsServiceHelper.stub(:api_request).and_return(stub_return)
      # DistanceMatrixHelper.stub(:make_api_call).and_return({"rows" =>
      # [{"elements" => [{"duration" => {"value" => 150}}]}]})
    end
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
