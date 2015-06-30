class StaticPagesController < ApplicationController
  before_action :authenticate_user!, except: :landing

  def mainmenu
    @vehicles = current_user.vehicles
    @jobs = current_user.jobs
    @trips = current_user.trips(:order => 'created_at DESC')
    @trips = current_user.trips.page(params[:page]).per(10)

  end

  def landing
  end

   def update
    #@users = current_user
    @user = User.find(params[:id])
   end
  end

  def mileagefilingdisplay
  end

  def disclaimor_filing
  end

  def profile
   @profile.user = current_user
  end
