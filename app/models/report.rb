class Report

#def miles
    #ending_odometer - starting_odometer
#end

 def roundtrip_commute
  daily_commute * days_worked
 end

 def years_mileage
  starting_odometer - year_ending_odometer
 end

 def biz_mileage
 end

 def percent_biz_useage
  biz_mileage / years_mileage
 end

 def work_mileage
  biz_mileage + roundtrip_commute
 end

 def other_mileage
  years_mileage - work_mileage
 end

end
