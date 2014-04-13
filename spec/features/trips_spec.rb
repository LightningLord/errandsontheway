require 'spec_helper'

describe "Trips" do
  context "with valid form fields" do
    before(:each) do
      VCR.use_cassette('trip_spec') do
        visit root_path
        fill_in "Where are you starting?", with: "460 Fell St. San Francisco, CA"
        fill_in "Where are you going?", with: "633 Folsom St. San Francisco, CA"
        click_on "Route my trip!"
      end
    end
    it "successfully submits your origin and destination" do
        expect(page).to have_content("Trip Duration")
    end

    it "finalizes a trip" do
      click_button "Finalize Trip"
      expect(page).to have_content("Trip Duration With Errands")
    end

    it "starts over" do
      click_on "Start Over"
      expect(page).to have_button "Route my trip!"
    end
  end
end
