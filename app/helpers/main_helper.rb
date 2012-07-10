require 'browser'
module MainHelper
  def active_sessions
    @current_session.active_sessions
  end

  def inactive_sessions
    @current_session.inactive_sessions
  end
end
