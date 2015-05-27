class AddEndtimeToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :end_time, :datetime
  end
end
