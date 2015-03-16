class YearEndingOdometer < ActiveRecord::Base
  belongs_to :vehicle
  belongs_to :filing
end
