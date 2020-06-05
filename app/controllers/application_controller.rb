class ApplicationController < ActionController::Base
  before_action :authenticate_user

  private

  def authenticate_user
    @currrent_user = User.find_by(id: session[:user_id])
    unless @currrent_user
      session[:return_to] ||= request.url
      redirect_to login_url, notice: "Please log in to access this page"
    end
  end
end
