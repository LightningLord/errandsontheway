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

      # it "should have an original duration larger than zero" do
      #   trip = FactoryGirl.create(:valid_trip)
      #   expect(trip.original_duration).to_not eq(0)
      # end
    
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

  describe "format durations" do
    let(:my_trip){FactoryGirl.create(:valid_trip)}
    before(:each){my_trip.update_attributes(original_duration: 1500, ending_duration: 3000)}
    it "should format the ending duration" do
      expect(my_trip.format_original_duration).to eq("25 minutes")
    end

    it "should format the original duration" do
      expect(my_trip.format_ending_duration).to eq("50 minutes")
    end

  end
end



