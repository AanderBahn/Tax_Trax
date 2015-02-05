class Vehicle < ActiveRecord::Base
  has_many :trips
  belongs_to :user
end
