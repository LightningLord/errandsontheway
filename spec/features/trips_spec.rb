require 'spec_helper'

describe "Trips" do

  it "can submit your origin and destination" do
    visit root_path
    fill_in "start-point", with: "460 Fell St. San Francisco"
    fill_in "end-point", with: ""
  end


end