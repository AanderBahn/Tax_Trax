class AddNotifiedToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :notified, :boolean, default: false
  end
end
