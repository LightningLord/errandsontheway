require 'spec_helper'

describe OptionsController do
  describe '#index' do
    context "with session " do
      let(:new_trip){FactoryGirl.create(:valid_trip)}
      before(:each) do
        stub_return = {"routes" => [{"legs" => [{"duration" => {"value" => 50} }] }]}
        DirectionsServiceHelper.stub(:api_request).and_return(stub_return)
        DistanceMatrixRetriever.stub(:make_api_call).and_return({"rows" =>
        [{"elements" => [{"duration" => {"value" => 150}}]}]})
        request.session[:trip_id] = new_trip.id
        place_stub_return_start = [{"name" => "DBC",
          "vicinity"=> "717 California Street, San Francisco, CA",
          "geometry" =>{"location" => {"lat" =>37.7, "lng" =>  -122.4 }} },
        {"name" => "DBC",
          "vicinity"=> "717 California Street, San Francisco, CA",
          "geometry" =>{"location" => {"lat" =>37.7, "lng" =>  -122.4 }} }]



        place_stub_return_end = [{"name" => "DBC new",
          "vicinity"=> "633 Folsom Street, San Francisco, CA",
          "geometry" =>{"location" => {"lat" =>37.7, "lng" =>  -122.4 }} },

        {"name" => "DBC new",
          "vicinity"=> "633 Folsom Street, San Francisco, CA",
          "geometry" =>{"location" => {"lat" =>37.7, "lng" =>  -122.4 }} } ]
        Place.stub(:request_businesses).and_return(place_stub_return_start, place_stub_return_end)
        get :index, :search => "Tacos"
      end

      it 'assigns a search term based on params' do
        expect(assigns(:search_term)).to eq('Tacos')
      end

      it 'assigns @businesses to 4 businesses' do
        expect(assigns(:businesses).length).to eq 4
      end

      it 'sorts by extra_duration' do
        expect(assigns(:businesses)).to eq assigns(:businesses).sort{|a,b| a.extra_duration <=> b.extra_duration}
      end

      it "assigns@trip to the right trip" do
        expect(assigns(:trip)).to eq new_trip
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

