require 'spec_helper'

describe "Routes" do

  context "entering origin and destination values" do
    context "with a proper origin and desination" do
      it "can submit your origin and destination" do
        visit root_path
        fill_in "start-point", with: "460 Fell St. San Francisco CA"
        fill_in "end-point", with: "633 Folsom St. San Francisco CA"
        click_on "Route it!"
        expect(page).to have_content("Trip duration")
      end
    end

    context "with an invalid origin and destination" do
      it "shows an error" do
        pending
      end
    end
  end


end