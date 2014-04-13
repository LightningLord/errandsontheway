require 'spec_helper'
describe Business do
  let(:my_business){Business.new("Ned's Place", "1 Stark Way")}
  it "calculates delta duration" do
    expect(my_business.calculate_delta_duration(30, 20)).to eq 10
  end

end