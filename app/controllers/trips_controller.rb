class TripsController < ApplicationController
  before_action :authenticate_user!

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new
    @trip.job_id = params[:job_id]
    @trip.shift_hours = params[:shift_hours]
    @trip.vehicle_id = params[:vehicle_id]
    @trip.starting_odometer = params[:starting_odometer]

    if @trip.save
      redirect_to "/trips/#{@trip.id}"
    else
      render :new
    end
  end

  def index
    @trip = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.ending_odometer = params[:ending_odometer]

    if @trip.save
      redirect_to "/trips/#{@trip.id}/confirm"
    else
      render :edit
    end
  end

  def destroy
    @trip = Trip.find(params[:id])

    @trip.destroy

    redirect_to my_trips_url, :notice => "Trip deleted."
  end

  def confirm
    @trip = Trip.find(params[:id])
  end

  def my_trips
   @trip = current_user.trips
  end

  def mileagefilingdisplay
  end

  def filing1
  end

  def filing2
  end

  def filing3
  end

end
