User.destroy_all
User.create!([
  {first_name: "Alex", last_name: "Bahn", email: "aanderbahn@gmail.com", password: "12345678", password_confirmation: "12345678", reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil},
  {first_name: "Daniel", last_name: "Lopes", email: "danielvlopes@gmail.com", password: "12345678", password_confirmation: "12345678", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil},
  {first_name: "EarthWorm", last_name: "Jim", email: "sega@gmail.com", password: "12345678", password_confirmation: "12345678", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 4, current_sign_in_at: "2015-02-26 15:55:33", last_sign_in_at: "2015-02-25 20:55:00", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"}
])
puts "Created #{User.count} users."

Job.destroy_all
Job.create!([
  {user_id: 3, name: "Uber 25", daily_commute: 0.0, industry: "Transportation"},
  {user_id: 3, name: "Greek Godz", daily_commute: 11.0, industry: "The Olympians"},
  {user_id: 3, name: "2-", daily_commute: 2.0, industry: "2"},
  {user_id: 3, name: "3", daily_commute: 3.0, industry: "3"},
  {user_id: 3, name: "4", daily_commute: 4.0, industry: "4"},
  {user_id: 3, name: "5", daily_commute: 5.0, industry: "5"},
  {user_id: 3, name: "6", daily_commute: 6.0, industry: "6"},
  {user_id: 3, name: "chicken", daily_commute: 3.0, industry: "food"},
  {user_id: 3, name: "11", daily_commute: 11.0, industry: "11"},
  {user_id: 3, name: "22", daily_commute: 22.0, industry: "22"},
  {user_id: 3, name: "33", daily_commute: 33.0, industry: "33"},
  {user_id: 3, name: "DDR", daily_commute: 2.0, industry: "dance"}
])
puts "Created #{Job.count} jobs."

Trip.destroy_all
Trip.create!([
  {job_id: 9, shift_hours: 3, starting_odometer: 11.0, ending_odometer: 14.0, vehicle_id: 1},
  {job_id: 1, shift_hours: 2, starting_odometer: 2.0, ending_odometer: 3.0, vehicle_id: 1},
  {job_id: 9, shift_hours: 4, starting_odometer: 4.0, ending_odometer: 5.0, vehicle_id: 1},
  {job_id: 7, shift_hours: 47, starting_odometer: 47.0, ending_odometer: 48.0, vehicle_id: 1}
])
puts "Created #{Trip.count} trips."

Vehicle.destroy_all
Vehicle.create!([
  {user_id: 3, make_model: "Millennium FalconzZ Corillian", year: 187, starting_odometer: "200", personal_usage: true},
  {user_id: 3, make_model: "Nimbus Cloud", year: 1997, starting_odometer: "9", personal_usage: true}
])
puts "Created #{Vehicle.count} vehicles."
