class Filing < ActiveRecord::Base
  belongs_to :user
  has_many   :year_ending_odometer

  RATES = {
    2014 => 0.56,
    2015 =>  0.575
  }

  def rate
    RATES[for_year]
  end
end

#@vehicle.total_miles_driven(@filing.for_year) - (total_trip_miles + commuting_miles)
