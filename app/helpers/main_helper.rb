require 'browser'
module MainHelper
  def logged_in_user
    LoginSession.find(session[:login_session])
  end

  def other_active_sessions
    LoginSession.where("email == :email AND activated == 't' AND terminated == 'f' AND id != :current_id", { :email => logged_in_user.email, :current_id => session[:login_session]})
  end

  def inactive_sessions
    LoginSession.find_all_by_email_and_terminated(logged_in_user.email, true)
  end

end
