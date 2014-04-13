require 'spec_helper'

describe Trip do
  it { should have_many :errands }
  it { should validate_presence_of(:start_point_address)}
  it { should validate_presence_of(:end_point_address)}
  let(:my_trip){FactoryGirl.create(:valid_trip)}

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
    before(:each){my_trip.update_attributes(original_duration: 1500, ending_duration: 3000)}
    it "should format the ending duration" do
      expect(my_trip.format_original_duration).to eq("25 minutes")
    end

    it "should format the original duration" do
      expect(my_trip.format_ending_duration).to eq("50 minutes")
    end
  end

  describe "set_coordinates" do
    before(:each) do
      my_trip.set_coordinates([33.33, 44.44],[55.55, 66.66])
      my_trip.save
    end

    it "should set start_point_latitude properly" do
      expect(my_trip.reload.start_point_latitude).to eq 33.33
    end

    it "should set start_point_longitude properly" do
      expect(my_trip.reload.start_point_longitude).to eq 44.44
    end

    it "should set end_point_latitude properly" do
      expect(my_trip.reload.end_point_latitude).to eq 55.55
    end

    it "should set end_point_longitude properly" do
      expect(my_trip.reload.end_point_longitude).to eq 66.66
    end
  end

  describe "set_duration" do
    it "sets the ending duration" do
      original_end_duration = my_trip.ending_duration
      my_trip.set_duration(3000)
      expect(my_trip.reload.ending_duration).to eq(original_end_duration + 3000)
    end
  end

  describe "update" do
    context "when CoordinatesRetriever returns coordinates" do
      before(:each) { my_trip.stub(:call_coordinates_retriever).and_return([33.33, 44.44])}
      let(:params){ {trip: {start_point_address: my_trip.start_point_address,
          end_point_address: my_trip.end_point_address}} }
      it "sets the coordinates" do
        my_trip.update(params)
        my_trip.save
        expect(my_trip.reload.start_point_latitude).to eq 33.33
      end

      it "calls set_coordinates" do
        expect(my_trip).to receive(:set_coordinates)
        my_trip.update(params)
      end
    end

    context "when CoordinatesRetriever does not return coordinates" do
      it "does not call set_coordinates" do
        my_trip.stub(:call_coordinates_retriever).and_return(nil)
        expect(my_trip).to_not receive(:set_coordinates)
        my_trip.update({trip: {}})
      end
    end

  end

end



