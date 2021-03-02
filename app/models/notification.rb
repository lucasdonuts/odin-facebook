class Notification < ApplicationRecord
  enum status: { unseen: 0, seen: 1 }
  
  scope :unseen, -> { where("status = 0") }

  belongs_to :user
  belongs_to :notifiable, polymorphic: true
end
