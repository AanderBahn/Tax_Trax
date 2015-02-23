class StaticPagesController < ApplicationController
  before_action :authenticate_user!

  def go
    render 'go'
  end

  def stop
    render 'stop'
  end

  def log
    render 'log'
  end

  def confirm
    render 'confirm'
  end

  def mainmenu
  end
end
