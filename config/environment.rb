# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
DisMardisOrdering::Application.initialize!

#config.action_mailer.delivery_method = :smtp

#ActionMailer::Base.smtp_settings = {
#  :address  => "smtp.someserver.net",
#  :port  => 25,
#  :user_name  => "someone@someserver.net",
#  :password  => "mypass",
#  :authentication  => :login
#}

#config.action_mailer.raise_delivery_errors = true