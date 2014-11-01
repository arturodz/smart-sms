class MessagesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  respond_to :json


  def receive
    to_sub = /^[^\ ]*/.match(params['Body'])[0]
    to = /^[^\ ]*/.match(params['Body'])[0].gsub('(at)','@')
    from = params['From'].gsub('+52','00521') + "@mxhack.bymail.in"
    body = params['Body'].gsub(to_sub,'')

    puts to
    puts "#{from.gsub('+','00')}@mxhack.bymail.in"
    puts "Correo de #{from}"
    puts body

    client = SendGrid::Client.new(api_user: 'arturodz', api_key: 'textmail')

    mail = SendGrid::Mail.new do |m|
      m.to = to
      m.from = from
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