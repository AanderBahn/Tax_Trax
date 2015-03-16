class Trip < ActiveRecord::Base
  belongs_to :job
  belongs_to :vehicle
  has_one    :user, through: :job

  validates :job_id, presence: true
  validates :starting_odometer, presence: true
  # validates :ending_odometer, presence: true
  validates :shift_hours, presence: true

  default_scope { order("created_at ASC") }

  def miles
    self.ending_odometer - self.starting_odometer
  end

# def roundtrip_commute
#  daily_commute * days_worked
# end

# def years_mileage
#   starting_odometer - year_ending_odometer
# end

# def biz_mileage
# end

# def percent_biz_useage
#  biz_mileage / years_mileage
# end

# def work_mileage
#  biz_mileage + roundtrip_commute
# end

#  def other_mileage
#   years_mileage - work_mileage
#  end

end
