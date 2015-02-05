class Trip < ActiveRecord::Base
  belongs_to :job
  has_one :user, through: :job

  validates :job_id, presence: true
  validates :starting_odometer, presence: true
  validates :shift_hours, presence: true

  def miles
    ending_odometer - starting_odometer
  end

end
