# require 'spec_helper'
# feature "Options", :js => true do
#   describe"return a list of business options" do
#     let(:my_trip){FactoryGirl.create(:valid_trip)}
#     before(:each) do
#       VCR.use_cassette('options_spec') do
#         visit root_path
#         fill_in "Where are you starting?", with: "460 Fell St, San Francisco, CA, United States"
#         fill_in "Where are you going?", with: "633 Folsom St, San Francisco, CA, United States"
#         find(:css, "#driving").click
#         wait_for_ajax_to_finish
#         click_on "Route my trip!"
#         fill_in "search", :with => "laundry"
#         click_on "Search"
#         save_and_open_page
#       end
#     end
#     it "displays the search term" do
#       wait_for_ajax_to_finish
#       expect(page).to have_content "laundry"
#     end
#     it "displays buttons to select a business" do
#       wait_for_ajax_to_finish
#       expect(page).to have_button "Choose this Business"
#     end
#
#   end
# end

