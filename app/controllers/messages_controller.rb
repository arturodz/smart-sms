class MessagesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  respond_to :json

  def create
    client.messages.create(
      from: "+15209993914",
      to: "+5216621690875",
      body: body("Pancho Villa", "Revolución!!!", "Texto de prueba")
    )

    render json: nil, status: 200
  end

  def receive
    client.messages.create(
      from: "+15209993914",
      to: params["From"],
      body: "Me escribiste: #{params['Body']}"
    )

    render json: nil, status: 200
  end

  def incoming_mail
    client.messages.create(
      from: "+15209993914",
      to: /\d/.match(params["to"],
      body: "De: #{params['from']}. Asunto: #{params['subject']}. Mensaje: #{params['text']}")
    )

    render json: nil, status: 200
  end
end