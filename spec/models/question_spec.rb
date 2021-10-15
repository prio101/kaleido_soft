require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:quiz) { FactoryBot.create(:quiz) }
  let(:question) { FactoryBot.create(:question, quiz: quiz) }
  describe 'should belongs to quiz' do
    it 'should have the quiz association' do
      expect(question.quiz_id).to eq quiz.id
    end
  end
end
