require 'spec_helper'

describe OptionsController do
  describe '#index' do
    context "with session " do
      let(:new_trip){FactoryGirl.create(:valid_trip)}
      before(:each) do
        VCR.use_cassette('options_controller_spec') do
          request.session[:trip_id] = new_trip.id
          get :index, :search => "Tacos"
        end
      end

      xit 'assigns a search term based on params' do
        expect(assigns(:search_term)).to eq('Tacos')
      end

      xit 'assigns @start_businesses to 2 businesses' do
        expect(assigns(:start_businesses).length).to eq 2
      end

      xit 'assigns @end_businesses to 2 businesses' do
        expect(assigns(:end_businesses).length).to eq 2
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

