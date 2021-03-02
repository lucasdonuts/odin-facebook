class FriendRequest < ApplicationRecord
  belongs_to :requester, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  has_one :notification, as: :notifiable, dependent: :destroy

  validates :requester_id, uniqueness: { scope: :recipient_id, case_sensitive: false }

  def accept
    Friendship.create!(friend_a_id: self.recipient.id, friend_b_id: self.requester.id)
  end

  def reject
    self.destroy
  end

end