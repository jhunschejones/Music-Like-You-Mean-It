class UsersController < ApplicationController
  class InsecureRequest < StandardError; end

  skip_before_action :authenticate_admin_user, only: [:create_workshop_users, :unsubscribe, :destroy]

  def index
    @users = User.where(site_role: User::SITE_USER)
  end

  def unsubscribe
    @user = User.from_unsubscribe_key(params[:id])
    session[:user_id] = @user.id
  rescue
    redirect_to workshop_path
  end

  def create_workshop_users
    user = User.find_or_create_workshop_user(name: user_params[:name], email: user_params[:email])
    if user.is_admin?
      reset_session
      redirect_to login_url
    else
      session[:user_id] = user.id
      WorkshopMailer.welcome_email(user.id).deliver_later
      redirect_to workshop_path
    end
  end

  def destroy
    @user = User.find(session[:user_id])
    secure_request!

    @user.destroy!
    reset_session

    flash[:notice] = "You have successfully unsubscribed."
    redirect_to workshop_path
  rescue
    if @user
      flash[:alert] = "Something went wrong! Please try again."
      redirect_to unsubscribe_path(id: @user.unsubscribe_key)
    else
      flash[:alert] = "Something went wrong! Please follow the unsubscribe link from your email again."
      redirect_to workshop_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def secure_request!
    raise InsecureRequest unless params[:id].to_s == session[:user_id].to_s
  end
end
