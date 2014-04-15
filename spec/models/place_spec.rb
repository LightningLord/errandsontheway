require 'spec_helper'

describe Place do
  let(:place){ Place.new('-33.87054', '151.198815', "laundry")}
  let(:business){{name: "Laundromat", address: "717 California Street, San Francisco", latitude: 37.7, longitude: -122}}
  before(:each) do
    Place.stub(:get_biz_names_addresses_coordinates).and_return([{"name" => business[:name], "vicinity" => business[:address], "latitude"=> business[:latitude], "longitude"=>business[:longitude]}])
  end

  it "extracts each business's name address, and coordinates" do
    expect(place.get_biz_names_addresses_coordinates[0].values).to include (business[:name] && business[:address] && business[:latitude] && business[:longitude])
  end



end