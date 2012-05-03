ActionMailer::Base.smtp_settings = {
  :address  => "smtp.gmail.com",
  :port  => 587,
  :user_name  => "dismardis",
  :password  => "sandslash",
  :authentication  => :login,
  :enable_starttls_auto => true
}