APP_CONFIG = YAML.load_file(Rails.root.join('config', 'secrets.yml'))[Rails.env]

ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => APP_CONFIG["domain"],
  :user_name            => APP_CONFIG["username"],
  :password             => APP_CONFIG["password"],
  :authentication       => 'plain',
  :enable_starttls_auto => true  }

Nopassword::Application.config.secret_token = APP_CONFIG['secret_token']
