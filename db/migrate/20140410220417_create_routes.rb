class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :url
      t.integer :ending_duration, :default => 0
      t.integer :original_duration, :default => 0
      t.point :start_point
      t.point :end_point

      t.timestamps
    end
  end
end
