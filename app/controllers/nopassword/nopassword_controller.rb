module Nopassword
  class NopasswordController < ApplicationController
    include CheckSession

    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/

    before_filter :check_valid_session

    def send_login_email
      redirect_to '/' if !request.post?
      email = request[:email]
      remote_ip = request.remote_ip
      user_agent = request.env["HTTP_USER_AGENT"]
      host = request.host
      if email =~ EMAIL_REGEX
        LoginSession.create_session(email, remote_ip, user_agent, host)
        flash[:notice] = "We sent an email to %{email}." % { :email => email }
      else
        flash[:notice] = "That doesn't look like a valid email address."
      end
      redirect_to '/'
    end

    def login
      id = request[:id]
      code = request[:code]
      remote_ip = request.remote_ip
      user_agent = request.env["HTTP_USER_AGENT"]
      login_session = LoginSession.find_by_id(id)
      if !login_session
        flash[:notice] = "That's not a valid login link."
      elsif login_session.activated? || login_session.terminated?
        flash[:notice] = "That code is already used."
      elsif login_session.expired?
        flash[:notice] = "That code is expired."
      elsif !login_session.activate_session(code, remote_ip, user_agent)
        flash[:notice] = "That code could not be used. Please request another."
      else
        session[:login_session] = login_session.id
      end
      redirect_to '/'
    end

    def logout
      @current_session.logout
      session[:login_session] = nil
      redirect_to '/'
    end

    def revoke
      id = request[:id]
      ls = LoginSession.find_by_id(id)
      render :json => { :success => :false } unless ls
      result = @current_session.revoke(ls)
      render :json => { :success => !!result }
    end
  end
end
