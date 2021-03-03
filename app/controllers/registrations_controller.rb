class RegistrationsController < Devise::RegistrationsController
  # def create
  #   super
  #   if @user.persisted?
  #     begin
  #       send_welcome_email
  #     rescue
  #       flash.notice = "Welcome to OdinBook! (Email failed to send)"
  #     end
  #   end
  # end

  # private

  # def send_welcome_email
  #   UserMailer.with(user: @user).welcome_email.deliver_now!
  # end
end