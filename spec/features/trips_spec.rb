# require 'spec_helper'

# feature "Trips", :js => true do
#   describe "Trips" do
#     context "with valid form fields" do
#       let(:fell){FactoryGirl.create(:fell)}
#       let(:folsom){FactoryGirl.create(:folsom)}
#       before(:each) do
#         stub_return = {"routes" => [{"legs" => [{"duration" => {"value" => 50} }] }]}
#         DirectionsServiceHelper.stub(:api_request).and_return(stub_return)
#         DistanceMatrixHelper.stub(:make_api_call).and_return({"rows" =>
#         [{"elements" => [{"duration" => {"value" => 150}}]}]})
#          place_stub_return_start = [{"name" => "DBC" },{"vicinity"=> "717 California Street, San Francisco, CA"}]
#         place_stub_return_end = [{"name" => "DBC new" },{"vicinity"=> "633 Folsom Street, San Francisco, CA"}]
#         Place.stub(:request_businesses).and_return(place_stub_return_start, place_stub_return_end)
#         visit root_path
#         fill_in "Where are you starting?", with: fell.address
#         fill_in "Where are you going?", with: folsom.address
#         find(:css, "#walking").click
#         click_on "Route my trip!"
#         save_and_open_page
#       end
#       it "successfully submits your origin and destination" do
#           expect(page).to have_content("Trip Duration")
#       end

#       it "finalizes a trip" do
#         click_link "Finalize Trip"
#         expect(page).to have_content("With Errands")
#       end

#       it "starts over" do
#         click_on "Start Over"
#         expect(page).to have_button "Route my trip!"
#       end
#     end
#   end

  # context "autofilling the user's origin based on their current location" do
  #   it "should fill in the origin field with an address", focus: true do
  #     visit root_path
  #     click_link 'current-location'
  #     wait_for_ajax_to_finish
  #     save_and_open_page
  #     puts "hello #{ find_field('trip_start_point_address').value}"
  #     expect(find_field('trip_start_point_address').value.to_not be_empty)
  #   end
  # end
# end

