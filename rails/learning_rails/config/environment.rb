# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# EDITOR="vim" bin/rails credentials:edit
# smtp_user_name=''
# smtp_password=''
Rails.application.configure do
  config.action_mailer.smtp_settings = {
    user_name: Rails.application.credentials.smtp_user_name,
    password: Rails.application.credentials.smtp_password,
    domain: 'favmap.com',
    address: 'smtp.sendgrid.net',
    port: 587,
    authentication: :plain,
    enable_starttls_auto: true
  }
end