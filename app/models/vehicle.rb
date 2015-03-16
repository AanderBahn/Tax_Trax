class Vehicle < ActiveRecord::Base
  has_many :trips
  belongs_to :user
  has_many :year_ending_odometers

  def trips_for_year(year)
    d1 = DateTime.new(year)
    d2 = d1.end_of_year
    trips.where(created_at: d1..d2)
  end

  def year_starting_odometer(year)
    last_year_ending = self.year_ending_odometers.find_by(:year => (year - 1))
    if last_year_ending.present?
      return last_year_ending.reading
    else
      return starting_odometer.to_i
    end
  end

  def year_ending_odometer(year)
    year_ending_entry = self.year_ending_odometers.find_by(:year => year)
    if year_ending_entry.present?
      return year_ending_entry.reading
    else
      return trips_for_year(year).last.try(:ending_odometer).to_i
    end
  end

  def total_miles_driven(year)
    return self.year_ending_odometer(year) - self.year_starting_odometer(year)
  end
end
