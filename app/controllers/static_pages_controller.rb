class StaticPagesController < ApplicationController
  before_action :authenticate_user!

  def mainmenu
    @vehicles = current_user.vehicles
    @jobs = current_user.jobs
    #@trips = current_user.jobs.trip
  end

  def mileagefilingdisplay
  end

  def disclaimor_filing
  end

  def profile
   @profile.user = current_user
  end
end
