class Filing < ActiveRecord::Base
  belongs_to :user
  has_many   :year_ending_odometer
end

#@vehicle.total_miles_driven(@filing.for_year) - (total_trip_miles + commuting_miles)
