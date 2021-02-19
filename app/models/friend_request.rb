class FriendRequest < ApplicationRecord
  enum status: { sent: 0, accepted: 1 }

  belongs_to :requester, class_name: 'User'
  belongs_to :recipient, class_name: 'User'
end
