require 'spec_helper'

describe "Trips" do
  context "with valid form fields" do
    it "successfully submits your origin and destination" do
      visit root_path
      fill_in "start-point", with: "460 Fell St. San Francisco, CA"
      fill_in "end-point", with: "633 Folsom St. San Francisco, CA"
      click_on "Route my trip!"
      expect(page).to have_content("Trip Duration")
    end
  end
end
