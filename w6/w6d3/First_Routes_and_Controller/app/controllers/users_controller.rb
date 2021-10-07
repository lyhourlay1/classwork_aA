class UsersController < ApplicationController

  def index
    users = User.all
    render json: users
    #render json: params
  end

  def show
    user = User.find(params[:id])
    render json: user
    
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to "/users/#{user.id}"
    else
      render json: user.errors.full_messages, status: 422
    end    
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  def user_params
    params.require(:user).permit(:fav_food)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: user
  end
end
