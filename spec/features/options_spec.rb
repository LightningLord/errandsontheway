require 'spec_helper'
feature "Options", :js => false do
  describe"return a list of business options" do
    let(:my_trip){FactoryGirl.create(:valid_trip)}

    before(:each) do
      VCR.use_cassette('options_spec') do
        visit root_path
        fill_in "Where are you starting?", with: "460 Fell St. San Francisco, CA"
        fill_in "Where are you going?", with: "633 Folsom St. San Francisco, CA"
        click_on "Route my trip!"
        fill_in "search", :with => "Laundry"
        click_on "Search"
      end
    end
    it "displays the search term" do
      expect(page).to have_content "Laundry"
    end

    it "displays buttons to select a business" do
      expect(page).to have_button "Choose this Business"
    end


  end
end

