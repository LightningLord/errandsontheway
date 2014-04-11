require 'spec_helper'

describe TripsController do
  describe "#new" do
    it "renders new page" do
      get :new
      expect(response).to render_template(:new)
    end

    it "should assign a trip variable" do
      get :new
      expect(assigns(:trip)).to be_a_new(Trip)
    end
  end
end