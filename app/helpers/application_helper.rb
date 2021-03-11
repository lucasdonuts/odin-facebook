module ApplicationHelper
  include Pagy::Frontend

  def avatar(user, size=32)
    if user.avatar.attached?
      user.avatar.variant(resize: "x#{size}", crop: "#{size}x#{size}+#{size/2}+0")
    else
      'default_avatar.jpg'
    end
  end
end
