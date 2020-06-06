class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user

  def about
  end

  def privacy
  end

  def terms
  end

  def workshop
    @current_user = User.find(session[:user_id])
  rescue ActiveRecord::RecordNotFound
    render 'users/new_workshop_user'
  end
end
