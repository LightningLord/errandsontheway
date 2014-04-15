require 'spec_helper'

describe DirectionsServiceHelper do

  it "calculate the total duration with way points" do
    route_options = { origin: "origin address",
                      destination: "destination address",waypoints: ["errand1address", "errand2address"], travel_mode: "WALKING"}
    helper = DirectionsServiceHelper.new(route_options)

    stub_return = {"routes" => [{"legs" => [{"duration" => {"value" => 50} }] }]}
    helper.stub(:api_request).and_return(stub_return)
    expect(helper.calculate_total_duration).to eq(50)
  end

end