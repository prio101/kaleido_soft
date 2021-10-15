require 'rails_helper'

RSpec.describe Result, type: :model do
  let(:quiz) { FactoryBot.create(:quiz) }
  let(:user) { FactoryBot.create(:user) }
  let(:result) { FactoryBot.create(:result, quiz: quiz, user: user) }

  describe 'association' do
    it 'should have quiz id' do
      expect(result.quiz_id).to eq(quiz.id)
    end

    it 'should have user id' do
      expect(result.user_id).to eq(user.id)
    end
  end
end
