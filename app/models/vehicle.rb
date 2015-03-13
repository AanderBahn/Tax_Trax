class Vehicle < ActiveRecord::Base
  has_many :trips
  belongs_to :user
  has_many :year_ending_odometers
end
