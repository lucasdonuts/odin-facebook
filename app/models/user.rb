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
 
  has_many :friendships_as_friend_a, 
           class_name: 'Friendship',
           foreign_key: :friend_a_id,
           dependent: :destroy
  
  has_many :friendships_as_friend_b,
           class_name: 'Friendship',
           foreign_key: :friend_b_id,
           dependent: :destroy

  has_many :notifications, dependent: :destroy

  has_one_attached :avatar

  after_create :send_welcome_email

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
    self.friendships_as_friend_a.collect { |n| n.friend_b } +
    self.friendships_as_friend_b.collect { |n| n.friend_a }
  end

  def send_welcome_email
    unless self.email.include?("@example")
      UserMailer.with(user: self).welcome_email.deliver_now!
    end
  end

end
