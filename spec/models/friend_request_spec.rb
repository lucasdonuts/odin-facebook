require 'rails_helper'

RSpec.describe FriendRequest, type: :model do

  context 'associations' do

    it { should belong_to :requester }

    it { should belong_to :recipient }

  end

  context 'validations' do

    it do
      create(:friend_request)
      should validate_uniqueness_of(:requester_id).scoped_to(:recipient_id)
    end

  end

end
