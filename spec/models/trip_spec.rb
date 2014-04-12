require 'spec_helper'

describe Trip do
  it { should have_many :errands }
  it { should validate_presence_of(:start_point_address)}
  it { should validate_presence_of(:end_point_address)}

  describe "lat and long" do
    context "with a valid address" do
      it "should be valid" do
        trip = FactoryGirl.build(:valid_trip)
        expect(trip).to be_valid
      end

      it "should have an original duration larger than zero" do
        trip = FactoryGirl.build(:valid_trip)
        expect(trip.original_duration).to_not eq(0)
      end
    
    end

    context "with an invalid address" do
      it "should not be valid" do
        trip = FactoryGirl.build(:trip_with_invalid_addresses)
        trip.valid? 
        expect(trip).to have(1).error_on(:start_point_latitude)
        expect(trip).to have(1).error_on(:start_point_longitude)
        expect(trip).to have(1).error_on(:end_point_latitude)
        expect(trip).to have(1).error_on(:end_point_longitude)
      end
    end
  end
end



