class AddFieldsToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :start_point_address, :text
    add_column :trips, :end_point_address, :text
  end
end
