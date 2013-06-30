ENV['passw3rd-cipher_name'] = 'aes-256-cbc'
if %w{production staging}.include? ENV['RAILS_ENV']
  ENV['passw3rd-password_file_dir'] = Rails.root.join('config', 'passwords', 'production').to_s
  ENV['passw3rd-key_file_dir'] = Rails.root.join('config', 'passwords', 'production').to_s
else
  ENV['passw3rd-password_file_dir'] = Rails.root.join('config', 'passwords').to_s
  ENV['passw3rd-key_file_dir'] = Rails.root.join('config', 'passwords').to_s
end

Dummy::Application.config.secret_token = Passw3rd::PasswordService.get_password('secret_token')
