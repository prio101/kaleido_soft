class ResultsController < ApplicationController
  before_action :set_result, only: %i( show update destroy )

  def index
    @results = Result.all
    
    render json: @results, status: :ok
  end

  def create
    result = Result.new(result_params)
    if result.valid? and result.save!
      render json: { data: result, message: :created }, 
             status: :created
    else
      render json: { message: 'result cant be created', 
                     error: result.errors.messages 
                   }, 
             status: :bad_request
    end
  end

  def show
    unless @result.nil?
     render json: @result, status: :ok
    else
      render json: { errors: 'No Result Found' },
            status: :not_found
    end
  end

  def update
    if @result.update(result_params)
      render json: @result, 
             status: :ok
    else
      render json: { message: "can't update the result", 
                     errors: @question.errors.messages 
                   },
             status: :bad_request
    end  
  end

  def destroy
    @result.delete
    render json: { message: :deleted } , 
           status: :ok
  end

  private

  def set_result
    @result = Result.find_by_id(params[:id]) unless params[:id].nil?
  end

  def result_params
    params.require(:result).permit( :user_id, 
                                    :result,
                                    :feedback,
                                    :quiz_id
                                  )                   
  end
end
