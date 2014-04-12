require 'spec_helper'

describe Place do
  let(:place){ Place.new('-33.87054', '151.198815', "laundry")}
  let(:business){{name: "Laundromat", address: "717 California Street, San Francisco"}}
  before(:each) do
    Place.any_instance.stub(:request_businesses).and_return([{"name" => business[:name], "vicinity" => business[:address]}])
  end

  it "extracts each business's name and address" do
    expect(place.get_names_and_addresses[0].values).to include (business[:name] && business[:address])
  end



end