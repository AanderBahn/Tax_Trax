namespace :notify do

  desc 'Notify trips that just finished'
  task trips: :environment do
    Trip.not_notified.each do |trip|
      trip.notify
    end
  end
end
