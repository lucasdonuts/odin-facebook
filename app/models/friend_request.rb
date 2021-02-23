class FriendRequest < ApplicationRecord
  enum status: { sent: 0, accepted: 1, denied: 2 }

  belongs_to :requester, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  validates :requester_id, uniqueness: { scope: :recipient_id, case_sensitive: false }
end
