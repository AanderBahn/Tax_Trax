namespace :dummy do
  desc "Generates dummy data for the user. Required ENV['EMAIL']"
  task generate: :environment do
    user = User.find_by_email ENV['EMAIL']

    #job = Job.find_by_name ENV['Gorgoneion']

    #vehicle = Vehicle.find_by_make_model ENV['Dodge Viper']

    job = Job.create! user: user, name: "Gorgoneion", daily_commute: 5.4, industry: "Greek Icon"

    User.create!([
  {first_name: "Alex", last_name: "Bahn", email: "aanderbahn@gmail.com", phone: "6182464828", password: "12345678", password_confirmation: "12345678", reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil},
  {first_name: "Daniel", last_name: "Lopes", email: "danielvlopes@gmail.com", phone: "6182464828", password: "12345678", password_confirmation: "12345678", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil},
  {first_name: "EarthWorm", last_name: "Jim", email: "sega@gmail.com", phone: "6182464828", password: "12345678", password_confirmation: "12345678", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 4, current_sign_in_at: "2015-02-26 15:55:33", last_sign_in_at: "2015-02-25 20:55:00", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", avatar_file_name: "SthenoProfile.jpg"},
  {first_name: "Stheno",  last_name: "Gorgon", email: "stheno@gorgon.com", phone: "6182464828", password: "12345678", password_confirmation: "12345678", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-26 15:55:33", last_sign_in_at: "2015-02-25 20:55:00", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
  {first_name: "Medusa",  last_name: "Gorgon", email: "medusa@gorgon.com", phone: "6182464828", password: "12345678", password_confirmation: "12345678", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-26 15:55:33", last_sign_in_at: "2015-02-25 20:55:00", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
  {first_name: "Euryale", last_name: "Gorgon", email: "euryale@gorgon.com", phone: "6182464828", password: "12345678", password_confirmation: "12345678", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-26 15:55:33", last_sign_in_at: "2015-02-25 20:55:00", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"}
])
puts "Created #{User.count} users."

Job.create!([
  {user: stheno, name: "Gorgoneion", daily_commute: 5.4, industry: "Greek Icon"},
  {user: medusa, name: "Gorgoneion", daily_commute: 5.4, industry: "Greek Icon"},
  {user: euryale, name: "Gorgoneion", daily_commute: 5.4, industry: "Greek Icon"},
  {user: stheno, name: "Temple Guard", daily_commute: 4.0, industry: "Security"},
  {user: medusa, name: "Temple Guard", daily_commute: 4.0, industry: "Security"},
  {user: euryale, name: "Temple Guard", daily_commute: 4.0, industry: "Security"},
  {user: stheno, name: "Pita Pete's", daily_commute: 2.6, industry: "Food Service"},
  {user: medusa, name: "Pita Pete's", daily_commute: 2.6, industry: "Food Service"},
  {user: euryale, name: "Pita Pete's", daily_commute: 2.6, industry: "Food Service"}
])
puts "Created #{Job.count} jobs."

Vehicle.create!([
  {user: stheno, make_model: "Dodge Viper",       year: 187, starting_odometer: "0", personal_usage: true},
  {user: medusa, make_model: "Ford Cobra",        year: 187, starting_odometer: "0", personal_usage: true},
  {user: medusa, make_model: "Pontiac Firbird",   year: 187, starting_odometer: "0", personal_usage: true},
  {user: euryale, make_model: "Chevy Anaconda",    year: 187, starting_odometer: "250", personal_usage: true},
  {user: euryale, make_model: "Dodge Durango",     year: 187, starting_odometer: "0", personal_usage: true},
  {user: euryale, make_model: "Volkswagon Beetle", year: 187, starting_odometer: "0", personal_usage: true},
  {user_id: 3, make_model: "Millennium FalconzZ Corillian", year: 187, starting_odometer: "200", personal_usage: true},
  {user_id: 3, make_model: "Nimbus Cloud", year: 1997, starting_odometer: "9", personal_usage: true}
])
puts "Created #{Vehicle.count} vehicles."

  end

end
