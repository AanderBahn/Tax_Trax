class NotificationsController < ApplicationController
  def create
    # @client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
    @notification = Notification.new
    @notification.message = params[:notification][:message]
    @notification.recipient = params[:notification][:recipient]

     @user.phone.messages.create({
       :from => '+12816561311',
       :to   => @user.phone,
       :body => @notification.message,
     })

    #@redirect_to :back
  end

  def destroy
  end
end
