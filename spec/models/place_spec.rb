require 'spec_helper'

describe Place do
  let(:place){ Place.new('-33.87054', '151.198815', "laundry")}
  let(:business){{name: "Laundromat", address: "717 California Street, San Francisco"}}
  before(:each) do
    Place.any_instance.stub(:request_businesses).and_return([{"name" => business[:name], "vicinity" => business[:address]}])
  end

  it "extracts each business's name" do
    expect(place.get_names).to include business[:name]
  end

  it 'extracts each business address' do
    expect(place.get_addresses).to include business[:address]
  end

  it 'extracts the extra duration visiting this business would take'

end