require 'spec_helper'

describe Trip do
  it { should have_many :errands }
  it { should validate_presence_of(:start_point_address)}
  it { should validate_presence_of(:end_point_address)}
  it { should validate_presence_of(:start_point_latitude)}
  it { should validate_presence_of(:start_point_longitude)}
  it { should validate_presence_of(:end_point_latitude)}
  it { should validate_presence_of(:end_point_longitude)}

  
end
