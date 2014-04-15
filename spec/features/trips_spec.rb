require 'spec_helper'

feature "Trips", :js => true do
  describe "Trips" do
    context "with valid form fields" do
      before(:each) do
        VCR.use_cassette('trip_spec') do
          visit root_path
          fill_in "Where are you starting?", with: "460 Fell St. San Francisco, CA"
          fill_in "Where are you going?", with: "633 Folsom St. San Francisco, CA"
          find(:css, "#walking").click
          wait_for_ajax_to_finish
          click_on "Route my trip!"
          save_and_open_page
        end
      end
      it "successfully submits your origin and destination" do
          expect(page).to have_content("Trip Duration")
      end

      it "finalizes a trip" do
        click_link "Finalize Trip"
        expect(page).to have_content("Trip Duration With Errands")
      end

      it "starts over" do
        click_on "Start Over"
        expect(page).to have_button "Route my trip!"
      end
    end
  end
end