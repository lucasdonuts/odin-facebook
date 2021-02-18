require 'rails_helper'

RSpec.describe Comment, type: :model do
  
  context 'associations' do

    it { should belong_to :user }

    it { should belong_to :post }

    it { should have_many :likes }

  end

  context 'validations' do

    it { should validate_presence_of :body }

  end

end
