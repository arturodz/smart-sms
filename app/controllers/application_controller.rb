class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  

  def client
    account_sid = 'ACbb49022bd031a99d9967595de4d4216a'
    auth_token = '5be587638d9fa909c1ab0f116974dc65'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def body( sender, subject, body )
    "De: #{sender}, Sujeto: #{subject}: #{body}"
  end


end
