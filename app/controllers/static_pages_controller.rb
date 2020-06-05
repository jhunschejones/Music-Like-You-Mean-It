class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user

  def about
  end

  def privacy
  end

  def terms
  end

  def workshop
  end
end
