class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  has_one :notification, as: :notifiable, dependent: :destroy

  has_many :likes, as: :likeable, dependent: :destroy

  validates :body, presence: true
end
