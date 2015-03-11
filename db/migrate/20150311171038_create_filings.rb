class CreateFilings < ActiveRecord::Migration
  def change
    create_table :filings do |t|
      t.integer :year_end_odometer
      t.float :average_daily_commute
      t.boolean :personal_use_off_duty
      t.boolean :another_vehicle_personal
      t.boolean :has_evidence
      t.boolean :written_evidence
      t.belongs_to :user, index: true
      t.integer :for_year

      t.timestamps
    end
  end
end
