class MessagesController < ApplicationController
  def create
    client.messages.create(
      from: "+15209993914",
      to: "+5216621690875",
      body: body("Pancho Villa", "Revolución!!!", "Texto de prueba")
    )
    @body = body("Pancho Villa", "Revolución!!!", "Texto de prueba")
  end

  def receive
    twiml = Twilio::TwiML::Response.new do |r|
      r.Message do |message|
        message.Body "Hello to you"
      end
    end
    twiml.text
  end
end