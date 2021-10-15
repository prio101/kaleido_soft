class QuizesController < ApplicationController
  before_action :set_quiz, only: %i( show destroy )

  def index
    @quizes = Quiz.where(published: :published)
    
    render json: @quizes, include: ['questions'], status: :ok
  end

  def create
    quiz = Quiz.new(quiz_params)

    if quiz.valid? and quiz.save!
      render json: { data: quiz, message: :created }, 
             status: :created
    else
      render json: { message: 'quiz cant be created', 
                     error: quiz.errors.messages 
                   },
             status: :bad_request
    end
  end

  def show
    if @quiz.published?
      render json: @quiz, include: ['questions'], status: :ok
    else
      render json: { message: 'no quiz found' }, status: :not_found
    end
  end

  def destroy
    @quiz.update(published: :OFF)
    render json: { data: @quiz, message: :deleted } , status: :ok
  end

  private

  def set_quiz
    @quiz = Quiz.find(params[:id]) unless params[:id].nil?
  end

  def quiz_params
    params.require(:quiz).permit( 
                                  :topic, 
                                  :published,
                                  :questions_count,
                                  :correct_answer_reward,
                                  :difficulty
                                )
  end
end
