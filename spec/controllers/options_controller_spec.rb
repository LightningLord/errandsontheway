require 'spec_helper'

describe OptionsController do
  describe '#index' do
    context "with session " do
      let(:new_trip){FactoryGirl.create(:valid_trip)}
      before(:each) do
        stub_return = {"routes" => [{"legs" => [{"duration" => {"value" => 50} }] }]}
        DirectionsServiceHelper.stub(:api_request).and_return(stub_return)
        DistanceMatrixHelper.stub(:make_api_call).and_return({"rows" =>
        [{"elements" => [{"duration" => {"value" => 150}}]}]})
        request.session[:trip_id] = new_trip.id
        place_stub_return_start = [{"name" => "DBC" },{"vicinity"=> "717 California Street, San Francisco, CA"}]
        place_stub_return_end = [{"name" => "DBC new" },{"vicinity"=> "633 Folsom Street, San Francisco, CA"}]
        Place.stub(:request_businesses).and_return(place_stub_return_start, place_stub_return_end)
        get :index, :search => "Tacos"
      end

      it 'assigns a search term based on params' do
        expect(assigns(:search_term)).to eq('Tacos')
      end

      it 'assigns @businesses to 4 businesses' do
        expect(assigns(:businesses).length).to eq 4
      end

    end

    context "with no session" do
      it "redirects" do
        get :index, :search => "Tacos"
        expect(response).to redirect_to root_path
      end
    end
  end
end

