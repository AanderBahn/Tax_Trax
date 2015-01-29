Users
  first_name: string
  last_name: string
  email: string

Vehicles
  user_id: integer
  make: string
  model: string
  year: date
  personal_usage: boolean
  starting_odometer: float

Jobs
  user_id: integer
  name: string
  daily_commute: float
  industry: string

Trips
  job_id: integer
  shift_hours: integer
  starting_odometer: float
  ending_odometer: float