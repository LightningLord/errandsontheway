require 'spec_helper'

describe TripsController do

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
    it "should create a new trip" do
      expect{ create_trip }.to change {Trip.count}.by(1)
      expect(response).to be_redirect
    end
    it "assigns session[:trip_id]" do
      create_trip
      expect(session[:trip_id]).to_not be_nil
    end
    it "should create a new trip with valid addresses" do
      expect{post :create, trip: FactoryGirl.attributes_for(:valid_trip) }.to change {Trip.count}.by(1)
      expect(response).to be_redirect
    end

    it "should render new page for invalid addresses" do
      post :create, trip: {"start_point_address"=>"1BadAddress", "end_point_address"=>"2Bad Address"}
      expect(response).to render_template(:new)
    end
  end

  describe "#show" do
    
  end

end
