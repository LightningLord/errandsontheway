require 'spec_helper'
feature "Options", :js => false do
  describe"return a list of business options" do
    let(:my_trip){FactoryGirl.create(:valid_trip)}

    before(:each){
      visit root_path
      fill_in "start-point", with: "460 Fell St. San Francisco, CA"
      fill_in "end-point", with: "633 Folsom St. San Francisco, CA"
      click_on "Route my trip!"
      fill_in "search", :with => "Laundry"
      click_on "Search"
    }
    it "displays the search term" do
      expect(page).to have_content "Laundry"
    end

    xit "returns three business related to search term" do
      expect(page).to have_content ""
    end
  end
end