class Trip < ActiveRecord::Base
  belongs_to :job
  belongs_to :vehicle
  has_one    :user, through: :job

  validates :job_id, presence: true
  validates :starting_odometer, presence: true
  # validates :ending_odometer, presence: true
  validates :shift_hours, presence: true

  default_scope { order("date(trips.created_at) DESC") }

  Trip.page(1).per(50)

  #@trip = Trip.order('created_at').page params[:page]

  def miles
   if (self.ending_odometer && self.starting_odometer).present?
    self.ending_odometer - self.starting_odometer
   end
  end

  def rebate
   if miles.present?
   (miles * 0.56).round(2)
   end
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
