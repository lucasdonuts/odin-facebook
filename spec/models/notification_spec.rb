require 'rails_helper'

RSpec.describe Notification, type: :model do
  
  it { should belong_to :user }

  it { should belong_to :notifiable }

end
