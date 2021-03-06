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
    context "when GeocodeRetriever returns coordinates" do
      before(:each) do
        my_trip.stub(:call_coordinates_retriever).and_return([33.33, 44.44])
        my_trip.stub(:call_distance_matrix_helper).and_return(1500)
      end

      let(:params){ {trip: {start_point_address: my_trip.start_point_address,
          end_point_address: my_trip.end_point_address}} }
      it "sets the coordinates" do
        my_trip.add_api_info(params)
        my_trip.save
        expect(my_trip.reload.start_point_latitude).to eq 33.33
      end

      it "calls set_coordinates" do
        expect(my_trip).to receive(:set_coordinates)
        my_trip.add_api_info(params)
      end

      it "calls distance_matrix_helper" do
        expect(my_trip).to receive(:call_distance_matrix_helper)
        my_trip.add_api_info(params)
      end

      it "sets original duration" do
        my_trip.add_api_info(params)
        my_trip.save
        expect(my_trip.reload.original_duration).to eq 1500
      end
    end

    context "when GeocodeRetriever does not return coordinates" do
      before(:each){ my_trip.stub(:call_coordinates_retriever).and_return(nil)}
      after(:each){ my_trip.add_api_info({}) }

      it "does not call set_coordinates" do
        expect(my_trip).to_not receive(:set_coordinates)
      end

      it "does not call distance_matrix_helper  " do
        expect(my_trip).to_not receive(:call_distance_matrix_helper)
      end
    end
  end

  describe "#reached_max_errands?" do
    context "trip has not reached max errand limit" do
      it "should return false" do
        expect(my_trip.reached_max_errands?).to be(false)
      end
    end
    context "trip has reached max errand limit" do
      before(:each) do
        5.times do
          my_trip.errands.build(FactoryGirl.attributes_for(:valid_errand))
        end
      end
      it "should return true" do
        expect(my_trip.reached_max_errands?).to be(true)
      end
    end
  end

end



