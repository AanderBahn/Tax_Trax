class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true, uniqueness: true

  has_many :vehicles
  has_many :jobs
  has_many :trips, through: :jobs
  # has_many :trips, through: :vehicles

end
