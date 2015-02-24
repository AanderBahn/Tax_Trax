class JobsController < ApplicationController
  before_action :authenticate_user!

def new
    @job = Job.new
  end

  def create
    @job = Job.new
    @job.user_id       = params[:user_id]
    @job.name          = params[:name]
    @job.daily_commute = params[:daily_commute]
    @job.industry      = params[:industry]

    if @job.save
      redirect_to "/jobs/#{@job.id}"
    else
      render :new
    end
  end

  def index
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])

    if @job.save
      redirect_to "/jobs/#{@job.id}/confirm"
    else
      render :edit
    end
  end

  def confirm
    @job = Job.find(params[:id])
  end

  def my_jobs

  end

end
