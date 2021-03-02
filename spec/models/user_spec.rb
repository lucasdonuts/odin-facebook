require 'rails_helper'

RSpec.describe User, type: :model do

  context 'validations' do

    it { should validate_presence_of(:first_name) }
    
    it { should validate_presence_of(:last_name) }
    
    it { should validate_presence_of(:email) }

    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    
    it { should validate_presence_of(:password) }
  
  end

  context 'associations' do

    it { should have_many :posts }

    it { should have_many :comments }

    it { should have_many :sent_friend_requests }

    it { should have_many :friend_requests }

    it { should have_many :friendships_as_friend_a }

    it { should have_many :friendships_as_friend_b }

    it { should have_many :likes }

    it { should have_many :notifications }
    
  end

  context 'full name' do
    
    it "should return full name of user" do
      user = create(:user)
      expected = "#{user.first_name} #{user.last_name}"
      expect(user.full_name).to eq expected
    end
    
  end

  context 'friends' do
    
    it "should return a list of friends as User objects" do
      user = user_with_friends
      expect(user.friends).to all( be_a(User) )
    end

  end

end
