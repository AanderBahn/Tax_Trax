class RenameShiftHoursToShiftMinutes < ActiveRecord::Migration
  def change
   add_column :trips, :shift_minutes, :integer, :default => 0

  end
end
