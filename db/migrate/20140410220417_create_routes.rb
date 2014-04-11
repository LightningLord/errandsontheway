class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :url
      t.integer :ending_duration, :default => 0
      t.integer :original_duration, :default => 0
      t.float :start_point_latitude
      t.float :start_point_longitude
      t.float :end_point_latitude
      t.float :end_point_longitude
      t.timestamps
    end
  end
end
