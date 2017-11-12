module Nopassword
  class NoPasswordEmails < ActionMailer::Base
    include Nopassword::ApplicationHelper

    def no_password_email(email, id, time, remote_ip, user_agent, geo, code, host, protocol)
      @id = id
      @time = time.strftime("%e %b %Y %H:%m")
      @remote_ip = remote_ip
      @user_agent = browser_name(user_agent)
      @geo = geo
      @code = code
      @email = email
      @host = host
      @protocol = protocol
      mail(:to => email, :from => ENV["FROM_EMAIL"],
           :subject => "Login request from #{host}")
    end
  end
end
