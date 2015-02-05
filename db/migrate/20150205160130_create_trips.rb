class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :job_id
      t.integer :shift_hours_
      t.float :starting_odometer
      t.float :ending_odometer

      t.timestamps

    end
  end
end
