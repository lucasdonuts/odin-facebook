class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:new, :create]
end
