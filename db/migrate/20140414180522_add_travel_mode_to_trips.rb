class AddTravelModeToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :travel_mode, :string, default: "DRIVING"
  end
end
