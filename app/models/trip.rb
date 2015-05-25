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

  def trip_message(user)
    client = Twilio::REST::Client.new ENV['twilio_account_sid'], ENV['twilio_auth_token']

    client.account.messages.create({
      :from => '+12816561311',
      :to   => "+1#{user.phone}",
      :body => "Please remember to enter your end trip information.",
    })
  end

end
