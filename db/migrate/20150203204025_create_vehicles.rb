class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.references :user, index: true
      t.string :make
      t.string :model
      t.integer :year
      t.boolean :personal_usage
      t.float :starting_odometer

      t.timestamps
    end
  end
end
