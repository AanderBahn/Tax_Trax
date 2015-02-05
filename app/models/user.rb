class User < ActiveRecord::Base

  validates :email, presence: true, uniqueness: true

  has_many :jobs
  has_many :trips, through: :jobs
  has_many :vehicles

end
