class FriendRequestsController < ApplicationController
  before_action :set_recipient_and_requester, only: :create

  def create
    @request = FriendRequest.create!(recipient_id: @recipient.id, requester_id: @requester.id)
    redirect_to user_path(@recipient)
  end

  # def destroy
  #   @request = FriendRequest.find_by(recipient_id: @recipient.id, requester_id: @requester.id)
  #   @request.destroy!
  #   redirect_to user_path(@recipient)
  # end

  def destroy
    @response = params[:response]
    @request = FriendRequest.find(params[:id])
    
    if @response == "accept"
      @request.accept
    end

    @request.destroy!
  end

  private

  def set_recipient_and_requester
    @recipient = User.find(params[:recipient_id])
    @requester = current_user
  end

end