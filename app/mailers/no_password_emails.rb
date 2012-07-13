class NoPasswordEmails < ActionMailer::Base
  default :from => 'nopassword@alexsmolen.com',
    :return_path => 'nopassword@alexsmolen.com'

  def login_email(email, id, time, remote_ip, user_agent, code, site_name)
    @id = id
    @time = time.strftime("%e %b %Y %H:%m%p")
    @remote_ip = remote_ip
    @user_agent = user_agent
    @code = code
    @email = email
    @site_name = site_name
    mail(:to => email,
         :subject => "Login request from #{site_name}")
  end
end
