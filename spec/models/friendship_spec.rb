require 'rails_helper'

RSpec.describe Friendship, type: :model do
  
  # it { should belong_to :user }

  # it { should belong_to :friend }

  it { should belong_to :friend_a }

  it { should belong_to :friend_b }

  # Attempt 1
  # it { should validate_uniqueness_of(:friend_a_id).scoped_to(:friend_b_id) } # FAIL WTF

  # Attempt 2
  # it 'raises an error if users are already friends' do
    
  # end

end
