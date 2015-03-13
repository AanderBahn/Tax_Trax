json.array!(@year_ending_odometers) do |year_ending_odometer|
  json.extract! year_ending_odometer, :id, :year, :reading, :vehicle_id
  json.url year_ending_odometer_url(year_ending_odometer, format: :json)
end
