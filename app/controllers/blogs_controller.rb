class BlogsController < ApplicationController
  before_action :set_post, only: [:show, :destroy]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      redirect_to @blog, notice: 'Your blog was successfully created'
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @blog.delete
    redirect_to blogs_path, notice: 'Your blog was successfully deleted'
  end


  private

    def blog_params
      params.require(:blog).permit(:title, :date, :body)
    end

    def set_post
      @blog = Blog.find(params[:id])
    end

end
