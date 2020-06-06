class BlogsController < ApplicationController
  skip_before_action :authenticate_user, only: [:index, :show]

  def index
    @blogs = Blog.order({ published_at: :desc })
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def create
    Blog.create!(blogs_params)
    redirect_to blogs_path
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.update!(blogs_params)
    redirect_to blogs_path
  end

  def destroy
  end

  private

  def blogs_params
    params.require(:blog).permit(:title, :embedded_video, :published_at, :content)
  end
end
