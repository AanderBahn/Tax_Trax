class JobsController < ApplicationController
  before_action :authenticate_user!

def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user_id       = current_user

    if @job.save
      redirect_to "/jobs/index", :notice => "Job created successfully."
    else
      render 'new'
    end
  end

  def index
    @job = Job.all
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

  def destroy
    @job = Job.find(params[:id])

    @job.destroy

    redirect_to job_url, :notice => "Job Deleted."
  end

  def confirm
    @job = Job.find(params[:id])
  end

  def my_jobs
  end

  private

  def job_params
    params.require(:job).permit(:name, :daily_commute, :industry)
  end


end
