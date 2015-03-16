class Vehicle < ActiveRecord::Base
  belongs_to :user
  has_many :year_ending_odometers

  has_many :trips
  has_many :jobs, :through => :trips

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

  def service_start_date
    self.trips.order("created_at ASC").first.created_at
  end

  def total_miles(year)
    return self.year_ending_odometer(year) - self.year_starting_odometer(year)
  end

  def business_miles(year)
    running_total = 0

    self.trips_for_year(year).each do |trip|
      running_total = running_total + trip.miles
    end

    return running_total
  end

  def percent_business_use(year)
    return self.business_miles(year).to_f / self.total_miles(year)
  end

  def commuting_miles(year)
    total_commuting_miles = 0

    self.jobs.uniq.each do |job|
      job_trips = self.trips_for_year(year).where(:job_id => job.id)

      job_unique_days_worked = job_trips.group('DATE(created_at)').count('created_at').count

      job_commuting_miles = job.daily_commute * 2 * job_unique_days_worked

      total_commuting_miles = total_commuting_miles + job_commuting_miles
    end

    return total_commuting_miles.to_f
  end

  def average_daily_commute(year)
    total_unique_days_worked = self.trips_for_year(year).group('DATE(created_at)').count('created_at').count

    return self.commuting_miles(year).to_f / total_unique_days_worked
  end

  def other_miles(year)
    return self.total_miles(year) - (self.business_miles(year) + self.commuting_miles(year))
  end
end
