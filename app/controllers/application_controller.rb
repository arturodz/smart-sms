class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  

  def client
    account_sid = 'XXXX'
    auth_token = 'XXXX'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def body( sender, subject, body )
    "De: #{sender}, Sujeto: #{subject}: #{body}"
  end


end
