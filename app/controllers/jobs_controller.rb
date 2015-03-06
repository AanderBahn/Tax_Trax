class JobsController < ApplicationController
  before_action :authenticate_user!

def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user

    if @job.save
      redirect_to "/jobs", :notice => "Job created successfully."
    else
      render 'new'
    end
  end

  def index
    @job = current_user.jobs
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])

    if @job.update_attributes(job_params)
      redirect_to jobs_path, :notice => "Job updated successfully."
    else
      render jobs_path
    end
  end

  def destroy
    @job = Job.find(params[:id])

    @job.destroy

    redirect_to jobs_path, :notice => "Job deleted."
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
