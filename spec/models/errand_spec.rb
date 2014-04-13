require 'spec_helper'

describe Errand do

  it { should belong_to(:trip)}
  it { should validate_presence_of(:business_name) }
  it { should validate_presence_of(:latitude) }
  it { should validate_presence_of(:longitude) }
  it { should validate_presence_of(:delta_duration) }

  describe "set_coordinates" do
    let(:my_errand){FactoryGirl.create(:valid_errand)}
    it "sets latitude and longitude" do
      my_errand.set_coordinates([33.33,44.44])
      my_errand.save
      expect(my_errand.reload.latitude).to eq 33.33
      expect(my_errand.reload.longitude).to eq 44.44
    end
  end

end