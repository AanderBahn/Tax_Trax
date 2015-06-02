namespace :notify do

  desc 'Notify trips that just finished'
  task trips: :environment do
    Trip.to_notify.each do |trip|
      trip.notify
    end
  end
end
