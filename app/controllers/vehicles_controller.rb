class VehiclesController < ApplicationController
  before_action :authenticate_user!

  def index
    #@vehicle = Vehicle.all
    @vehicles = current_user.vehicles

    respond_to do |format|
     format.html # index.html.erb
     format.json { render json: @users }
   end
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.user  = current_user


    if @vehicle.save
      redirect_to vehicles_path, :notice => "Vehicle created successfully."
    else
      render 'new'
    end
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def update
    @vehicle = Vehicle.find(params[:id])


    if @vehicle.update_attributes(vehicle_params)
      redirect_to vehicles_path, :notice => "Vehicle updated successfully."
    else
      render vehicles_path
    end
  end

  def destroy
    @vehicle = Vehicle.find(params[:id])

    @vehicle.destroy

    redirect_to vehicles_path, :notice => "Vehicle deleted."
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:make_model, :year, :personal_usage, :starting_odometer)
  end

end






