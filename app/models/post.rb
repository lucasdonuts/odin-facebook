class Post < ApplicationRecord
  belongs_to :user
  
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  has_one_attached :photo

  scope :recent, -> { order("created_at DESC") }

  validate :not_empty

  def not_empty
    if body.empty? && !photo.attached?
      errors.add(:base, :no_photo_or_body, message: "Nothing to post")
    end
  end
end
