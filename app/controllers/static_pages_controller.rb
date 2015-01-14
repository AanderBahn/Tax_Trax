class StaticPagesController < ApplicationController
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
end
