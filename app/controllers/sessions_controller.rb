class SessionsController < ApplicationController

  def create
    
  end

  def destroy
    session[:user_id] = nil
  end

end