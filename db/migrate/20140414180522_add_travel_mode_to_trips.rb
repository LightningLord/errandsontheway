class AddTravelModeToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :travel_mode, :string
  end
end
