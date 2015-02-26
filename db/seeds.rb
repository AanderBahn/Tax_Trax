User.create!([
  {first_name: "Alex", last_name: "Bahn", email: "AanderBahn@gmail.com", password: "password", password_confirmation: "password"},
  {first_name: "Daniel", last_name: "Lopes", email: "danielvlopes@gmail.com", password: "password", password_confirmation: "password"}
])

alex = User.find_by(email: "AanderBahn@gmail.com")

j1 = Job.new(name: "Boston Market", daily_commute: 3, industry: "Food Service")
j1.user = alex
j1.save

make = ["Toyota", "Suburu", "Ford", "Volkswagon", "Chrysler", "Audi", "Fiat"]
model = ["Runner", "Outback", "Fusion", "Jetta", "Sebring", "A8", "Mini"]
years = ["1990", "2015"]

100.times do
  alex.vehicles << Vehicle.new(make: make.sample, model: model.sample, year: years.sample, personal_usage: true, starting_odometer: 143_000.0)
end

