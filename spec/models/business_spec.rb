require 'spec_helper'
describe Business do
  let(:my_business){Business.new("Ned's Place", "1 Stark Way")}
  it "sets extra duration" do
    my_business.set_extra_duration(30, 20)
    expect(my_business.extra_duration).to eq 10
  end

  it "sets extra duration to 0 if negative" do
    my_business.set_extra_duration(10, 20)
    expect(my_business.extra_duration).to eq 0
  end

end