class ApplicationController < ActionController::Base
  include Pagy::Backend
  
  before_action :authenticate_user!, except: [:new, :create]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,
                                                       :last_name,
                                                       :email,
                                                       :password,
                                                       :password_confirmation,
                                                       :avatar])
    # devise_parameter_sanitizer.permit(:account_update, keys: [:first_name,
    #                                                           :last_name,
    #                                                           :email,
    #                                                           :password,
    #                                                           :password_confirmation,
    #                                                           :avatar])
  end
end
