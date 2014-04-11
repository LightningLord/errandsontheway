require 'spec_helper'

describe Place do
  let(:place){ Place.new('-33.87054', '151.198815', "laundry")}
  let(:business){{name: "Laundromat", address: "717 California Street, San Francisco"}}

  it "extracts each business's name" do
    place.stub(:request_businesses).and_return([{"name" => business[:name]}])
    expect(place.get_names).to include business[:name]
  end
  it 'extracts each business address' do
    place.stub(:request_businesses).and_return([{"vicinity" => business[:address]}])
    expect(place.get_addresses).to include business[:address]
  end
  it 'extracts the extra duration visiting this business would take'

end