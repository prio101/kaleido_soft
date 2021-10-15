require 'rails_helper'

RSpec.describe Quiz, type: :model do
  let(:quiz_invalid) { FactoryBot.build(:quiz, 
                                  topic: '', 
                                  questions_count: nil, 
                                  correct_answer_reward: nil) }
  let(:quiz) { FactoryBot.build(:quiz, 
                                  topic: 'topicA')}
  
  let(:quiz_two) { FactoryBot.build(:quiz, 
                                      topic: 'topicA') }                              
  describe 'validations' do
    it 'should be invalid without topic' do
      expect(quiz_invalid).to be_invalid
    end
    
    it 'should be unique topic' do
      quiz
      expect(quiz_two).not_to be_valid
    end

    it 'should be invalid without question count' do
      expect(quiz_invalid).not_to be_valid
    end

    it 'should be invalid without correct answer reward' do
      expect(quiz_invalid).not_to be_valid
    end
  end
end
