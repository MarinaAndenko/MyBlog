
Devise.setup do |config|
  
  config.mailer_sender = 'sloboda@app.com'

  
  require 'devise/orm/active_record'

  
  config.authentication_keys = [ :email ]

  config.case_insensitive_keys = [:username]
  #config.case_insensitive_keys = [ :email, :username ]
  #config.strip_whitespace_keys = [ :email, :username ]

  config.strip_whitespace_keys = [:username]

  
  config.skip_session_storage = [:http_auth]

  
  config.stretches = Rails.env.test? ? 1 : 10

  
  config.reconfirmable = false


  config.expire_all_remember_me_on_sign_out = true

  
  config.password_length = 1..72

  
  config.reset_password_within = 6.hours

 
  config.sign_out_via = :delete
  
end
