json.array!(@filings) do |filing|
  json.extract! filing, :id, :year_end_odometer, :average_daily_commute, :personal_use_off_duty, :another_vehicle_personal, :has_evidence, :written_evidence, :user_id, :for_year
  json.url filing_url(filing, format: :json)
end
