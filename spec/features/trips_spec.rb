require 'spec_helper'

describe "Trips" do

  it "can submit your origin and destination" do
    context "with valid form fields" do
      visit root_path
      fill_in "start-point", with: "460 Fell St. San Francisco, CA"
      fill_in "end-point", with: "633 Folsom St. San Francisco, CA"
      click_on "Route my trip!"
      expect(page).to have_content("Trip Duration")
    end
    context "with invalid form fields" do
      pending
    end    
  end

end