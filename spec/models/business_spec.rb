require 'spec_helper'
describe Business do
  let(:my_business){Business.new("Ned's Place", "1 Stark Way", 37.7, -122)}
  let(:my_trip){FactoryGirl.create(:valid_trip)}
  it "sets directions" do
    stub_return = {"routes" => [{"legs" => [{"duration" => {"value" => 50} }] }]}
    DirectionsServiceHelper.stub(:api_request).and_return(stub_return)
    expect(my_business).to receive(:calculate_extra_duration).with(50, my_trip.original_duration)
    my_business.set_extra_duration(my_trip)
  end

  it "sets extra duration to 0 if negative" do
    stub_return = {"routes" => [{"legs" => [{"duration" => {"value" => -20} }] }]}
    DirectionsServiceHelper.stub(:api_request).and_return(stub_return)
    my_business.set_extra_duration(my_trip)
    expect(my_business.extra_duration).to eq 0
  end

  it "sets extra duration" do
    stub_return = {"routes" => [{"legs" => [{"duration" => {"value" => 50} }] }]}
    DirectionsServiceHelper.stub(:api_request).and_return(stub_return)
    my_business.set_extra_duration(my_trip)
    expect(my_business.extra_duration).to eq 50
  end

end