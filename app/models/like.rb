class Like < ApplicationRecord
  # enum status: { unliked: 0, liked: 1 }
  belongs_to :user
  belongs_to :likeable, polymorphic: true
end
