class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true

  has_one :notification, as: :notifiable, dependent: :destroy

  validates :user_id, uniqueness: { scope: :likeable_id }
end
