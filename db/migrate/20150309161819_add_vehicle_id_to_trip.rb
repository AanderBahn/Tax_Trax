class AddVehicleIdToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :vehicle_id, :integer
  end
end
