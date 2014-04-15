require 'spec_helper'
describe GeocodeRetriever do
  let(:fell){FactoryGirl.create(:fell)}
  describe "get_coordinates" do

    it "does not call create_location when it finds a location in db" do
      expect(GeocodeRetriever).to_not receive(:create_location_from_address)
      GeocodeRetriever.get_coordinates(fell.address)
    end
    it "does call create_location when it doesn't find a location in db" do
      expect(GeocodeRetriever).to receive(:create_location_from_address)
      GeocodeRetriever.get_coordinates("633 Folsom Street, San Francisco, CA")
    end
  end

  describe "get_address" do
    it "does not call create_location when it finds a location in db" do
      expect(GeocodeRetriever).to_not receive(:create_location_from_coords)
      GeocodeRetriever.get_address([fell.latitude, fell.longitude])
    end

    it "does call create_location when it doesn't find a location in db" do
      expect(GeocodeRetriever).to receive(:create_location_from_coords)
      GeocodeRetriever.get_address([37.7836265563965, -122.3976974487])
    end
  end

  describe "create_location" do
    it "by address" do
      Geocoder.stub(:coordinates).and_return([0,0])
      expect{
        GeocodeRetriever.get_coordinates("633 Folsom Street, San Francisco, CA")
        }.to change{Location.count}.by(1)
    end

    it "by coordinates" do
      Geocoder.stub(:address).and_return("460 Fell Street, San Francisco, CA")
      expect {
        GeocodeRetriever.get_address([37.7836265563965, -122.3976974487])
      }.to change{Location.count}.by(1)
    end

  end


end