class QuestionsController < ApplicationController
  before_action :set_question, only: %i( show update destroy )

  def index
    @questions = Question.all
    
    render json: @questions, status: :ok
  end

  def create
    questions = Question.new(question_params)

    if question.valid? and question.save!
      render json: { data: question, message: :created }, 
             status: :created
    else
      render json: { message: 'question cant be created', 
                     error: question.errors.messages 
                   }, 
             status: :bad_request
    end
  end

  def show
    render json: @question, status: :ok
  end

  def update
    if @question.update(question_params)
      render json: @question, status: :updated
    else
      render json: { message: "can't update the question", errors: @question.errors.messages },
             status: :bad_request
    end  
  end

  def destroy
    @question.delete
    render json: { message: :deleted } , status: :ok
  end

  private

  def set_question
    @question = Question.find(params[:id]) unless params[:id].nil?
  end

  def question_params
    params.require(:question).permit( 
                                  :question, 
                                  :options,
                                  :correct_answer,
                                  :quizes_id
                                )
  end
end
