class ChangeErrandsDuration < ActiveRecord::Migration
  def change
    rename_column(:errands, :additional_duration, :delta_duration)
  end
end
