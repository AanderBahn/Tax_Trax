class YearEndingOdometersController < ApplicationController
  before_action :set_year_ending_odometer, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @year_ending_odometers = YearEndingOdometer.all
    respond_with(@year_ending_odometers)
  end

  def show
    respond_with(@year_ending_odometer)
  end

  def new
    @year_ending_odometer = YearEndingOdometer.new
    respond_with(@year_ending_odometer)
  end

  def edit
  end

  def create
    @year_ending_odometer = YearEndingOdometer.new(year_ending_odometer_params)
    @year_ending_odometer.save
    redirect_to :back
  end

  def update
    @year_ending_odometer.update(year_ending_odometer_params)
    respond_with(@year_ending_odometer)
  end

  def destroy
    @year_ending_odometer.destroy
    respond_with(@year_ending_odometer)
  end

  private
    def set_year_ending_odometer
      @year_ending_odometer = YearEndingOdometer.find(params[:id])
    end

    def year_ending_odometer_params
      params.require(:year_ending_odometer).permit(:year, :reading, :vehicle_id)
    end
end
