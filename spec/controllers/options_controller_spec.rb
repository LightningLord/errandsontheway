require 'spec_helper'

describe OptionsController do
  describe '#index' do
    let(:new_trip){FactoryGirl.create(:valid_trip)}
    let(:business){{name: "Laundromat", address: "717 California Street, San Francisco"}}

    before(:each) do
      request.session[:trip_id] = new_trip.id
      get :index, :search => "Tacos"
    end

    it 'assigns a search term based on params' do
      expect(assigns(:search_term)).to eq('Tacos')
    end

    # it 'assigns @businesses to four businesses' do
    #   Place.any_instance.stub(:request_businesses).and_return([{"name" => business[:name], "vicinity" => business[:address]}])
    #   stub_return = {"routes" => [{"legs" => [{"duration" => {"value" => 50} }] }]}
    #   DirectionsServiceHelper.any_instance.stub(:api_request).and_return(stub_return)
    #   p assigns(:businesses)
    # end

  end
end

