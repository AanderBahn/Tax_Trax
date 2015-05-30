  class Trip < ActiveRecord::Base
  belongs_to :job
  belongs_to :vehicle
  has_one    :user, through: :job

  validates :job_id, presence: true
  validates :starting_odometer, presence: true
  # validates :ending_odometer, presence: true
  validates :shift_hours, presence: true

  default_scope { order("date(trips.created_at) DESC") }

  #scope :not_notified, -> {where '1=1' }  # an example could be { where notified: false }
  #scope :not_notified, -> { where(notified: false).where('end_time > ? ', Time.now) }
  scope :not_notified, -> { where(notified: false).where('end_time < ? ', Time.current) }

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

  def to_number
    "+1#{user.phone}"
  end

  def from_number
    "+12816561311"
  end

  def notify
    if user.valid?
      Message.new(from_number).send(to_number, "Please enter your end trip #{id} data.") #{}"Your trip #{id} is completed")
    end
    update notified: true
  end



before_save :calculate_end_time
def calculate_end_time
  self.end_time = Time.now + shift_hours.hours
end


end
