# class Friendship < ApplicationRecord
#   belongs_to :user
#   belongs_to :friend, class_name: 'User'

#   validates :user_id, uniqueness: { scope: :friend_id }
# end

class Friendship < ApplicationRecord
  #belongs_to :user
  belongs_to :friend_a, class_name: 'User'
  belongs_to :friend_b, class_name: 'User'

  # validates :friend_a_id, uniqueness: { scope: :friend_b_id }
  # validates :friendship_does_not_exist_yet

  # def friendship_does_not_exist_yet
  #   if User.where(
  #     friend_a_id: friend_b_id, friend_b_id: friend_a_id
  #     ).or(
  #     User.where(friend_a_id: friend_a_id, friend_b_id: friend_b_id)
  #     ).exists?
  #     self.errors.add(:friend_a_id, "Already friends")
  #     self.errors.add(:friend_b_id, "Already friends")
  #   end
  # end
end
