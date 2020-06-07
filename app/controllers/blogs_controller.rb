class BlogsController < ApplicationController
  skip_before_action :authenticate_admin_user, only: [:index, :show]

  def index
    unless params[:tag]
      @blogs = Blog.includes(:tags).order({ published_at: :desc }) and return
    end

    @blogs =
      if params[:tag].is_a? Array
        Blog.joins(:tags).where("tags.text IN (?)", params[:tag]).to_a
      else
        Blog.joins(:tags).where("tags.text = ?", params[:tag]).to_a
      end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def edit
    @blog = Blog.includes(:tags).find(params[:id])
    @tag = Tag.new
  end

  def create
    ActiveRecord::Base.transaction do
      blog = Blog.create!(blogs_params.except(:blog_tags))
      blogs_params[:blog_tags].split(",").each do |tag_text|
        Tag.create!(blog_id: blog.id, text: tag_text)
      end
    end

    redirect_to blogs_path
  end

  def update
    ActiveRecord::Base.transaction do
      @blog = Blog.find(params[:id])
      @blog.update!(blogs_params.except(:blog_tags))
      params[:blog][:tag][:text].split(",").each do |tag_text|
        Tag.create(text: tag_text, blog_id: @blog.id)
      end
    end

    redirect_to blogs_path
  end

  private

  def blogs_params
    params.require(:blog).permit(:title, :embedded_video, :published_at, :content, :blog_tags, tag_attributes: [:text, :blog_id])
  end
end
