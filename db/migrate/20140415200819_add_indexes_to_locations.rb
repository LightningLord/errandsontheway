class AddIndexesToLocations < ActiveRecord::Migration
  def change
    add_index :locations, :address, name: "address_index"
    add_index :locations, :latitude, name: "lat_index"
    add_index :locations, :longitude, name: "long_index"

  end
end
