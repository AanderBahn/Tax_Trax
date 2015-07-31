namespace :dummy do
  desc "Generates dummy data for the user. Required ENV['EMAIL']"
  task generate: :environment do
    user = User.find_by_email ENV['EMAIL']

    job = Job.create! user: user, name: "Gorgoneion", daily_commute: 5.4, industry: "Greek Icon"

  end

end
