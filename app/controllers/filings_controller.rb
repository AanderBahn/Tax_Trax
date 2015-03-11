class FilingsController < ApplicationController
  before_action :set_filing, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @filings = Filing.all
    respond_with(@filings)
  end

  def show
    respond_with(@filing)
  end

  def new
    @filing = Filing.new
    respond_with(@filing)
  end

  def edit
  end

  def create
    @filing = Filing.new(filing_params)
    @filing.user = current_user
    @filing.save
    respond_with(@filing)
  end

  def update
    @filing.update(filing_params)
    respond_with(@filing)
  end

  def destroy
    @filing.destroy
    respond_with(@filing)
  end

  private
    def set_filing
      @filing = Filing.find(params[:id])
    end

    def filing_params
      params.require(:filing).permit(:year_end_odometer, :average_daily_commute, :personal_use_off_duty, :another_vehicle_personal, :has_evidence, :written_evidence, :user_id, :for_year)
    end
end
