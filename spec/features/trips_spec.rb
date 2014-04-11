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

    context "with invalid form fields" do
      it "does not submit your origin and destination" do
        pending
      end
    end

    context "fetching and saving lat/long" do
      context "with a valid origin and destination addresses" do
        it "should set and save lat/long columns" do
          pending
        end
      end

      contex "with an invalid origin and destination addresses" do
        it "should not save lat/long columns" do
          pending
        end
      end
    end    
end
