User.create!([
  {first_name: "Alex", last_name: "Bahn", email: "AanderBahn@gmail.com"},
  {first_name: "Daniel", last_name: "Lopes", email: "danielvlopes@gmail.com"}
])

alex = User.find_by(email: "AanderBahn@gmail.com")

j1 = Job.new(name: "Boston Market", daily_commute: 3, industry: "Food Service")
j1.user = alex
j1.save

alex.vehicles << Vehicle.new(make: "Toyota", model: "Rav 4", year: "2007", personal_usage: true, starting_odometer: 143_000.0)
