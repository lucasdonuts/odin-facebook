class FriendRequestsController < ApplicationController
  before_action :set_recipient_and_requester, only: :create

  def create
    @request = FriendRequest.create!(recipient_id: @recipient.id, requester_id: @requester.id)
    
    if @request.save
      Notification.create!(
          user_id: @request.recipient_id,
          notifiable: @request
        )
    end

    redirect_to params[:redirect]
  end

  def destroy
    @response = params[:response]
    @request = FriendRequest.find(params[:id])
    
    if @response == "accept"
      @request.accept
    end

    @request.destroy!
    redirect_to params[:redirect]
  end

  private

  def set_recipient_and_requester
    @recipient = User.find(params[:recipient_id])
    @requester = current_user
  end

end