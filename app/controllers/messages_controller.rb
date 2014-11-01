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
    to = /^[^\ ]*/.match(params['Body'])[0]
    from = params['From']
    body = params['Body'].gsub(to,'')

    mail = SendGrid::Mail.new do |m|
      m.to = to
      m.from = "#{from}@mxhack.bymail.in"
      m.subject = "Correo de #{from}"
      m.text = body
    end

    puts client.send(mail) 

    render json: nil, status: 200
  end

  /^[^\ ]*/

  def incoming_mail
    to = params['to']
    from = params['from']
    subject = params['subject']
    text = params['text']

    client.messages.create(
      from: "+15209993914",
      to: to.gsub('@mxhack.bymail.in','').gsub('00','+'),
      body: "De: #{from}. Asunto: #{subject}. Mensaje: #{text}"
    )

    render json: nil, status: 200
  end
end