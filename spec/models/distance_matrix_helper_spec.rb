require 'spec_helper'

describe DistanceMatrixHelper do
  describe "get_trip_duration" do
    it "returns the duration" do
    DistanceMatrixHelper.any_instance.stub(:make_api_call).and_return({"rows" =>
      [{"elements" => [{"duration" => {"value" => 150}}]}]})
    expect(DistanceMatrixHelper.new({}).get_trip_duration).to eq 150
    end
  end
end