require 'spec_helper'
feature "Options", :js => false do
  describe"return a list of business options" do
    let(:my_trip){FactoryGirl.create(:trip)}
    xit "returns three business options" do
      visit trip_path(my_trip)
      fill_in "search", :with => "Laundry"
      click_on "Search"
      expect(page).to have_content "Search Results"
    end
  end
end