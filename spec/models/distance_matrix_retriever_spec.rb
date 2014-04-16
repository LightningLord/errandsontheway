require 'spec_helper'

describe DistanceMatrixRetriever do
  describe "get_trip_duration" do
    it "returns the duration" do
    DistanceMatrixRetriever.stub(:make_api_call).and_return({"rows" =>
      [{"elements" => [{"duration" => {"value" => 150}}]}]})
    expect(DistanceMatrixRetriever.new({travel_mode: "WALKING"}).get_trip_duration).to eq 150
    end
  end
end