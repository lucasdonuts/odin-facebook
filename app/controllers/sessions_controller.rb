class SessionsController < ApplicationController

  def new
    session[:user_id] = current_user.id
  end

  def destroy
    session[:user_id] = nil
  end

end