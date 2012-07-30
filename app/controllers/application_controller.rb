class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_valid_session

  def check_valid_session
    if session[:login_session]
      @current_session = LoginSession.find_by_id(session[:login_session])
      if !@current_session.active?
        session[:login_session] = nil
        redirect_to '/'
      end
    end
  end
end
