class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :check_valid_session
end
