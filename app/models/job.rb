class Job < ActiveRecord::Base
  belongs_to :user

  has_many :trips

  def total_miles
    total = 0
    self.trips.each do |trip|
      total += trip.miles
    end
    return total
  end
end
