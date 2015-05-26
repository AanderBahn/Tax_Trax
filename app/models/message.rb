class Message

  def initialize(from_number)
    @from_number = from_number
  end

  def send(to, body)
    client.messages.create from: @from_number, to: to, body: body
  end

  def client
    @client ||= Twilio::REST::Client.new
  end
end
