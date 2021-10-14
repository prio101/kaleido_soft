class UsersController < ApplicationController
  before_action :set_user, only: %i( show update destroy )

  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def create
    user = User.new(user_params)
    if user.valid? and user.save!
      render json: { data: user, message: :created }, 
             status: :created
    else
      render json: { message: 'user cant be created', 
                     error: user.errors.messages 
                   }, 
             status: :bad_request
    end
  end

  def show
    unless @user.nil?
     render json: @user, status: :ok
    else
      render json: { errors: 'No user Found' },
             status: :not_found
    end
  end

  def update
    if @user.update(user_params)
      render json: @user, 
             status: :ok
    else
      render json: { message: "can't update the user", 
                     errors: @user.errors.messages 
                   },
             status: :bad_request
    end  
  end

  def destroy
    @user.delete
    render json: { message: :deleted },
           status: :ok
  end

  private

  def set_user
    @user = User.find_by_id(params[:id]) unless params[:id].nil?
  end

  def user_params
    params.require(:user).permit( :first_name,
                                  :last_name,
                                  :email
                                )                   
  end
end
