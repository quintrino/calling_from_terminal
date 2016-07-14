require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = ENV["TWILIO_ACCOUNT_TOKEN"]
auth_token = ENV["TWILIO_AUTH_TOKEN"]

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

# # alternatively, you can preconfigure the client like so
Twilio.configure do |config|
  config.account_sid = account_sid
  config.auth_token = auth_token
end

# and then you can create a new client without parameters
@client = Twilio::REST::Client.new

@call = @client.calls.create(
  from: ENV["TWILIO_OUTGOING_NUMBER"],
  to: ENV["PERSONAL_MOBILE"],
  url: "http://twimlets.com/forward?PhoneNumber=%2B#{ARGV[0]}&"
)

puts "http://twimlets.com/forward?PhoneNumber=%2B#{ARGV[0]}&"