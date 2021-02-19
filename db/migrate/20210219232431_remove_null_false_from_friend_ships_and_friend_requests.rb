class RemoveNullFalseFromFriendShipsAndFriendRequests < ActiveRecord::Migration[6.1]
  def change
    change_column_null :friendships, :friend_id, true
    change_column_null :friendships, :user_id, true

    change_column_null :friend_requests, :recipient_id, true
    change_column_null :friend_requests, :requester_id, true
  end
end
