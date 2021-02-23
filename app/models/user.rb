class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,
         omniauth_providers: %i[ facebook ]

  validates :email, uniqueness: true, presence: true
  validates :first_name, :last_name, presence: true
  validates :password, confirmation: true, presence: true

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :sent_friend_requests,
           foreign_key: :requester_id,
           class_name: 'FriendRequest',
           dependent: :destroy
  has_many :friend_requests,
           foreign_key: :recipient_id,
           class_name: 'FriendRequest',
           dependent: :destroy

  has_many :friendships, 
           ->(user) { where("friend_a_id = ? OR friend_b_id = ?", user.id, user.id) },
           dependent: :destroy
  # has_many :friends, through: :friendships, source: :user

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.email = auth.info.email
      user.provider = auth.provider
      user.uid = auth.uid
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def friends
    Friendship.where("friend_a_id = ? OR friend_b_id = ?", self.id, self.id)
  end
end
