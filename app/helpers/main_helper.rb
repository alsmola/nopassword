require 'browser'
module MainHelper
  def logged_in_user
    LoginSession.find(session[:login_session])
  end

  def active_sessions
    LoginSession.where("email == :email AND activated == 't' AND terminated == 'f'", { :email => logged_in_user.email })
  end

  def inactive_sessions
    LoginSession.find_all_by_email_and_terminated(logged_in_user.email, true)
  end

end
