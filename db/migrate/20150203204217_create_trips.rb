class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.references :job, index: true
      t.integer :shift_hours
      t.float :starting_odometer
      t.float :ending_odometer

      t.timestamps
    end
  end
end
