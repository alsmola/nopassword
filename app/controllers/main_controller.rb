class MainController < ApplicationController

  before_filter :check_valid_session

  def check_valid_session
    session[:login_session] = nil if session[:login_session] && LoginSession.find(session[:login_session]).terminated
  end

  def send_login_email
    email = request[:email]
    remote_ip = request.remote_ip
    user_agent = request.env["HTTP_USER_AGENT"]
    session = LoginSession.new(:email => email, :requesting_ip => remote_ip, :requesting_user_agent => user_agent)
    code = session.generate_code
    session.save
    NoPasswordEmails.login_email(email, session.id, session.created_at, remote_ip, user_agent, code).deliver
    flash[:notice] = "We sent an email to %{email}" % { :email => email }
    redirect_to '/'
  end

  def login
    id = request[:id]
    code = request[:code]
    login_session = LoginSession.lookup_code(id, code)
    if !login_session
      flash[:notice] = "That code sucked."
    elsif login_session.activated? || login_session.terminated?
      flash[:notice] = "That code is already used."
    elsif login_session.expired?
      flash[:notice] = "That code is old as shit."
    else
      session[:login_session] = login_session.id
      login_session.activated_at = DateTime.now
      login_session.activating_ip = request.remote_ip
      login_session.activating_user_agent = request.env["HTTP_USER_AGENT"]
      login_session.activated = true
      login_session.save
    end
    redirect_to '/'
  end

  def logout
    login_session = LoginSession.find(session[:login_session])
    login_session.terminated_at = DateTime.now
    login_session.terminated = true
    login_session.save
    session[:login_session] = nil
    redirect_to '/'
  end

  def revoke
    id = request[:id]
    login_session = LoginSession.find(id)
    login_session.terminated_at = DateTime.now
    login_session.terminated = true
    login_session.save
    render :json => { :success => :true } 
  end
end
