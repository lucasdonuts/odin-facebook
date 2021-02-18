require 'rails_helper'

RSpec.describe Post, type: :model do
  
  it { should belong_to(:user) }

  it "should have many comments"

  it { should have_many :likes }

  it "should validate presence of body"
  
end
