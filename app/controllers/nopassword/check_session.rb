module Nopassword
  module CheckSession
    def check_valid_session
      if session[:login_session]
        @current_session = Nopassword::LoginSession.find_by_id(session[:login_session])
        if !@current_session.active?
          session[:login_session] = nil
          redirect_to main_app.root_url
        end
      end
    end
  end
end
