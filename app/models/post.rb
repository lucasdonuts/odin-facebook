class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  scope :recent, -> { order("created_at DESC") }

  validates :body, presence: true
end
