require 'spec_helper'

describe TripsController do

  let(:my_trip){FactoryGirl.create(:valid_trip)}
  describe "#new" do
    before(:each){get :new}
    it "renders new page" do
      expect(response).to render_template(:new)
    end

    it "should assign a trip variable" do
      expect(assigns(:trip)).to be_a_new(Trip)
    end

    it "should clear the session" do
      expect(session[:trip_id]).to be_nil
    end
  end

  describe "#create" do
    let(:create_trip){post :create, trip: FactoryGirl.attributes_for(:valid_trip)}
    xit "should create a new trip" do
      VCR.use_cassette('trips_controller_spec') do
        expect{ create_trip }.to change {Trip.count}.by(1)
        expect(response).to be_redirect
      end
    end
    xit "assigns session[:trip_id]" do
      VCR.use_cassette('trips_controller_spec') do
        create_trip
        expect(session[:trip_id]).to_not be_nil
      end
    end
    xit "should create a new trip with valid addresses" do
      VCR.use_cassette('trips_controller_spec') do
        expect{post :create, trip: FactoryGirl.attributes_for(:valid_trip) }.to change {Trip.count}.by(1)
        expect(response).to be_redirect
      end
    end

    xit "should create trip with an original duration larger than zero" do
      VCR.use_cassette('trips_controller_spec') do
        expect{post :create, trip: FactoryGirl.attributes_for(:valid_trip) }.to change {Trip.count}.by(1)
        expect(Trip.find(session[:trip_id]).original_duration).to_not eq(0)
      end
    end

  end

  describe "finalize and summary" do
    before(:each){request.session[:trip_id] = my_trip.id}
    describe "#finalize" do
      it "assigns a secure random url to a trip" do
        my_trip.update_attributes(url: nil)
        post :finalize
        expect(my_trip.reload.url).to_not be_nil
      end

      it "redirects to the trip_summary_path" do
        post :finalize
        expect(response).to redirect_to trip_summary_path(my_trip.reload.url)
      end
    end

    describe "#summary" do
      before(:each){get :summary, :url => my_trip.url}
      it "is successful" do
        expect(response).to render_template(:summary)
      end

      it "assigns @trip to the right trip" do
        expect(assigns(:trip)).to eq(my_trip)
      end
    end
  end

  describe "#show" do
    context "session set" do
      before(:each) do
        my_trip.update_attributes(original_duration: 500, ending_duration: 1000)
        request.session[:trip_id] = my_trip.id
        get :show, :id => my_trip.id
      end
      it "assigns @trip properly" do
        expect(assigns(:trip)).to eq my_trip
      end

      it "assigns @trip_duration to original_duration when no errands" do
        expect(assigns(:trip_duration)).to eq my_trip.original_duration
      end

      it "assigns @trip_duration to ending_duration when trip has errands" do
        my_trip.errands << FactoryGirl.create(:valid_errand)
        get :show, :id => my_trip.id
        expect(assigns(:trip_duration)).to eq my_trip.ending_duration
      end
    end

    context "no session" do
      it "redirects to root path" do
        get :show, :id => my_trip.id
        expect(response).to redirect_to(root_path)
      end
    end

  end
end
