require 'passw3rd'

APP_CONFIG = YAML.load_file(Rails.root.join('config', 'email.yml'))[Rails.env]

ENV['passw3rd-cipher_name'] = 'aes-256-cbc'
if %w{production staging}.include? ENV['RAILS_ENV']
    ENV['passw3rd-password_file_dir'] = File.expand_path('../../passwords/production', __FILE__)
    ENV['passw3rd-key_file_dir'] = File.expand_path('../../passwords/production', __FILE__)
else
    ENV['passw3rd-password_file_dir'] = File.expand_path('../../passwords', __FILE__)
    ENV['passw3rd-key_file_dir'] = File.expand_path('../../passwords', __FILE__)
end 

ActionMailer::Base.smtp_settings = {
  :address              => APP_CONFIG["email_server_address"],
  :port                 => APP_CONFIG["email_port"],
  :domain               => APP_CONFIG["email_domain"],
  :user_name            => APP_CONFIG["email_username"],
  :password             => Passw3rd::PasswordService.get_password('email_password'),
  :authentication       => 'plain',
  :enable_starttls_auto => true  }

Nopassword::Application.config.secret_token = Passw3rd::PasswordService.get_password('secret_token')
