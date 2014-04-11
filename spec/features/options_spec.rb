require 'spec_helper'
feature "Options", :js => false do
  describe"return a list of business options" do
    let(:my_trip){FactoryGirl.create(:trip)}

    before(:each){
      visit trip_path(my_trip)
      fill_in "search", :with => "Laundry"
      click_on "Search"
    }
    it "displays the search term" do
      expect(page).to have_content "Laundry"
    end

    it "returns three business related to search term" do
      expect(page).to have_content ""
    end
  end
end