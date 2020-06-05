class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]

  def index
  end

  def new
  end

  def create
  end

  def destroy
  end
end
