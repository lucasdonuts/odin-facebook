require 'rails_helper'

RSpec.describe Like, type: :model do

  context "associations" do
  
    it { should belong_to :likeable }

    it { should belong_to :user }

  end

  context "validations" do

    it do
      create(:like)
      should validate_uniqueness_of(:user_id).scoped_to(:likeable_id)
    end
    
  end

end
