
class Api::V1::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.messages }, status: :bad_request
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
