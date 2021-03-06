  class TripsController < ApplicationController
  before_action :authenticate_user!

 #@trips = Trip.order('created_at').page params[:page]

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new
    @trip.job_id = params[:job_id]
    @trip.shift_hours = params[:shift_hours]
    @trip.shift_minutes = params[:shift_minutes]
    @trip.vehicle_id = params[:vehicle_id]
    @trip.starting_odometer = params[:starting_odometer]
    #@trip.created_at = created_at - 6

    if @trip.save
      redirect_to "/trips/#{@trip.id}"
    else
      render :new
    end
  end

  def index
    @trip = Trip.all(:order => 'created_at DESC')
    @trip = Trip.order('created_at').page params[:page]
    @trip = Trip.page(params[:page]).per(10)
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

    redirect_to root_url, :notice => "Trip deleted."
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
