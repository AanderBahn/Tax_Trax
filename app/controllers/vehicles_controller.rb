class VehiclesController < ApplicationController
  before_action :authenticate_user!

  def index
    @vehicles = Vehicle.all
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new
    @vehicle.user_id = params[:user_id]
    @vehicle.make = params[:make]
    @vehicle.model = params[:model]
    @vehicle.year = params[:year]
    @vehicle.personal_usage = params[:personal_usage]
    @vehicle.starting_odometer = params[:starting_odometer]
    @vehicle.float = params[:float]

    if @vehicle.save
      redirect_to "/vehicles", :notice => "Vehicle created successfully."
    else
      render 'new'
    end
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def update
    @vehicle = Vehicle.find(params[:id])

    @vehicle.user_id = params[:user_id]
    @vehicle.make = params[:make]
    @vehicle.model = params[:model]
    @vehicle.year = params[:year]
    @vehicle.personal_usage = params[:personal_usage]
    @vehicle.starting_odometer = params[:starting_odometer]
    @vehicle.float = params[:float]

    if @vehicle.save
      redirect_to "/vehicles", :notice => "Vehicle updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @vehicle = Vehicle.find(params[:id])

    @vehicle.destroy

    redirect_to "/vehicles", :notice => "Vehicle deleted."
  end
end
