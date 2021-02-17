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

    it { should have_many(:posts) }

    it "should have many friends"

    it "should have many comments"

    it "should have many friend_requests"

    it "should have many notifications"

    it "should have many likes"
    
  end

end
