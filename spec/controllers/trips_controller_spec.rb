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
  end

  describe "#create" do
    it "should create a new trip" do
      expect{post :create, trip: FactoryGirl.attributes_for(:trip) }.to change {Trip.count}.by(1)
      expect(response).to be_redirect
    end
  end
end




