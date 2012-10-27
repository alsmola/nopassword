require 'rubygems'
require 'bcrypt'
require 'browser'
require 'passw3rd'
require 'geoip'

module Nopassword
  class Engine < ::Rails::Engine
    isolate_namespace Nopassword

    initializer "load_secrets" do
      ENV['passw3rd-cipher_name'] = 'aes-256-cbc'
      if %w{production staging}.include? ENV['RAILS_ENV']
        ENV['passw3rd-password_file_dir'] = Rails.root.join('config', 'passwords', 'production').to_s
        ENV['passw3rd-key_file_dir'] = Rails.root.join('config', 'passwords', 'production').to_s
      else
        ENV['passw3rd-password_file_dir'] = Rails.root.join('config', 'passwords').to_s
        ENV['passw3rd-key_file_dir'] = Rails.root.join('config', 'passwords').to_s
      end
    end

    initializer  "load_helpers" do
      ActionController::Base.send :include, CheckSession
      ActionView::Base.send :include, ApplicationHelper
    end

    initializer  "email_settings" do
      MAIL_SETTINGS = YAML.load_file(Rails.root.join('config', 'email.yml'))[Rails.env] rescue nil
      if MAIL_SETTINGS
        ActionMailer::Base.smtp_settings = {
          :address              => MAIL_SETTINGS["email_server_address"],
          :port                 => MAIL_SETTINGS["email_port"],
          :domain               => MAIL_SETTINGS["email_domain"],
          :user_name            => MAIL_SETTINGS["email_username"],
          :password             => Passw3rd::PasswordService.get_password('email_password'),
          :authentication       => 'plain',
          :enable_starttls_auto => true
        }
      end
    end

    config.from_email = 'nopassword@alexsmolen.com'
    config.return_email = 'nopassword@alexsmolen.com'
  end
end
