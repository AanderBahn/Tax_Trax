class TripsController < ApplicationController

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new
    @trip.job_id = params[:job_id]
    @trip.shift_hours = params[:shift_hours]
    @trip.starting_odometer = params[:starting_odometer]
    @trip.save

    redirect_to "/trips/show"
  end

  def show
  end

  def edit
  end

  def confirm
  end

private

  def current_user
    @user ||= User.first
  end
  helper_method :current_user

end
