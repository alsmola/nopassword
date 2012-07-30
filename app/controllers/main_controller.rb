class MainController < ApplicationController
  def revoke
    id = request[:id]
    @current_session.revoke(id)
    render :json => { :success => :true } 
  end
end
