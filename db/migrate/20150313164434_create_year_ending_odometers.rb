class CreateYearEndingOdometers < ActiveRecord::Migration
  def change
    create_table :year_ending_odometers do |t|
      t.integer :year
      t.integer :reading
      t.belongs_to :vehicle, index: true

      t.timestamps
    end
  end
end
