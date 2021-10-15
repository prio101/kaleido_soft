require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }
  let(:result) { FactoryBot.create(:result, user: user) }
  let(:result_one) { FactoryBot.create(:result, user: user) }

  describe 'associations' do
    it 'should have many results' do
      result
      result_one
      expect(user.results.count).to eq 2 
    end
  end
end
