class RemoveYearEndOdometerFromFilings < ActiveRecord::Migration
  def change
    remove_column :filings, :year_end_odometer
  end
end
