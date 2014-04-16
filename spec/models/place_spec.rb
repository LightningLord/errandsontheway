require 'spec_helper'

describe Place do
  let(:place){ Place.new('-33.87054', '151.198815', "laundry")}
  let(:business){{name: "Laundromat", address: "717 California Street, San Francisco", latitude: 37.7, longitude: -122}}

  before(:each) do
    place_stub_return = [{"name" => "DBC",
    "vicinity"=> "717 California Street, San Francisco, CA",
    "geometry" =>{"location" => {"lat" =>37.7, "lng" =>  -122 }} },
    {"name" => "DBC",
    "vicinity"=> "717 California Street, San Francisco, CA",
    "geometry" =>{"location" => {"lat" =>37.7, "lng" =>  -122 }} }]
    Place.stub(:request_businesses).and_return(place_stub_return)
  end

  it "extracts each business's name address, and coordinates" do
    expect(place.get_biz_names_addresses_coordinates[0].values).to include (business[:name] && business[:address] && business[:latitude] && business[:longitude])
  end



end