class AddUniqueScopedIndexToFriendRequests < ActiveRecord::Migration[6.1]
  def change
    add_index :friend_requests, [:recipient_id, :requester_id], unique: true
  end
end
