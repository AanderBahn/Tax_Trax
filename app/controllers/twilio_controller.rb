require 'twilio-ruby'

account_sid = "ACXXXXX"

auth_token = "YYYYYY"

from_number = "+12816561311"

to_number = "+16182464828"
begin
    client = Twilio::REST::Client.new account_sid, auth_token
    client.account.messages.create(
        from => from_number,
        to => to_number,
        body => "Daisy Daisy give me your answer do"
    )
rescue Twilio::REST::RequestError => e
    puts e.message
end

# calling message

class TwilioController < ApplicationController
  include Webhookable

  after_filter :set_header

  skip_before_action :verify_authenticity_token

  def voice
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'Hello again friend of a friend. I knew you when.', :voice => 'alice'
         r.Play 'http://linode.rabasa.com/cantina.mp3'
    end

    render_twiml response
  end
end

module Webhookable
extend ActiveSupport::Concern

  def set_header
          response.headers["Content-Type"] = "text/xml"
  end

  def render_twiml(response)
          render text: response.text
  end

end
