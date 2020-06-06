class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:create_workshop_users]

  def index
    @users = User.where(site_role: User::SITE_USER)
  end

  def create_workshop_users
    user = User.find_or_create_workshop_user(name: user_params[:name], email: user_params[:email])
    session[:user_id] = user.id
    redirect_to workshop_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
