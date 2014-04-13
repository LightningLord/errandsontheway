require 'spec_helper'

describe "Trips" do
  context "with valid form fields" do
    it "successfully submits your origin and destination" do
      VCR.use_cassette('trip_spec') do
        visit root_path
        fill_in "Where are you starting?", with: "460 Fell St. San Francisco, CA"
        fill_in "Where are you going?", with: "633 Folsom St. San Francisco, CA"
        click_on "Route my trip!"
        expect(page).to have_content("Trip Duration")
      end
    end
  end
end
