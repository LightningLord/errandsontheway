require 'spec_helper'

describe Errand do

  it { should belong_to(:trip)}
  it { should validate_presence_of(:business_name) }
  it { should validate_presence_of(:latitude) }
  it { should validate_presence_of(:longitude) }
  it { should validate_presence_of(:delta_duration) }

end