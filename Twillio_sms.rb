require 'twilio-ruby'

class Twiliosms

  def send_confirm_sms
    account_sid = "AC70edc4480c7ec69ec4dbb4881d868c9b"
    auth_token = "c5b48f1ef699447280788be9a7b1d898"

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: "Thank you for signing up to Makers BnB!",
        to: "+447510336800",
        from: "+441477652055")
  end

end
