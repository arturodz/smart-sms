class MessagesController < ApplicationController
  def create
    client.messages.create(
      from: "+15209993914",
      to: "+5216621690875",
      body: body("Pancho Villa", "Revolución!!!", "Texto de prueba")
    )
  end

  def receive
    client.messages.create(
      from: "+15209993914",
      to: params["From"],
      body: "Me escribiste: #{params['Body']}"
    )
  end

  def incoming_mail
    puts params.inspect
  end
end