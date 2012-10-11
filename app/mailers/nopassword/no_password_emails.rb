module Nopassword
  class NoPasswordEmails < ActionMailer::Base
    include Nopassword::ApplicationHelper

    default :from => 'nopassword@alexsmolen.com',
      :return_path => 'nopassword@alexsmolen.com'

    def no_password_email(email, id, time, remote_ip, user_agent, geo, code, host)
      @id = id
      @time = time.strftime("%e %b %Y %H:%m")
      @remote_ip = remote_ip
      @user_agent = browser_name(user_agent)
      @geo = geo
      @code = code
      @email = email
      @host = host
      mail(:to => email,
           :subject => "Login request from #{host}")
    end
  end
end
