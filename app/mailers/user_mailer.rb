class UserMailer < ApplicationMailer
  default to: -> { @user.email }

  def welcome_email
    @user = params[:user]
    mail(subject: 'Welcome to OdinBook!')
  end
end
