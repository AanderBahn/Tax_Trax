class Vehicle < ActiveRecord::Base
  has_many :trips
  belongs_to :user
  has_many :year_ending_odometers

  def year_starting_odometer(year)
    last_year_ending = self.year_ending_odometers.find_by(:year => (year - 1))
    if last_year_ending.present?
      return last_year_ending.reading
    else
      return starting_odometer.to_i
    end
  end

  def year_ending_odometer(year)
    return self.year_ending_odometers.find_by(:year => year).reading
  end

  def total_miles_driven(year)
    return self.year_ending_odometer(year) - self.year_starting_odometer(year)
  end
end
