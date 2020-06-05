class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]

  def index
  end

  def new
  end

  def create
    User.create!(user_params)
    redirect_to workshop_path
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
