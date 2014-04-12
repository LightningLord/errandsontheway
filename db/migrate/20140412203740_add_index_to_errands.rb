class AddIndexToErrands < ActiveRecord::Migration
  def change
    add_index :errands, :trip_id, name: 'trip_id_ix'
  end
end
