class NoPasswordEmails < ActionMailer::Base
  default :from => 'nopassword@alexsmolen.com',
    :return_path => 'nopassword@alexsmolen.com'

  def no_password_email(email, id, time, remote_ip, user_agent, code, host)
    @id = id
    @time = time.strftime("%e %b %Y %H:%m%p")
    @remote_ip = remote_ip
    @user_agent = user_agent
    @code = code
    @email = email
    @host = host
    mail(:to => email,
         :subject => "Login request from #{host}")
  end
end
