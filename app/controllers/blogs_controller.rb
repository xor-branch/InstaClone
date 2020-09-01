class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  def index
    @blogs= Blog.all
    @user = User.all
  end
  def new
    @blog = Blog.new
  end
  def create
    @blog=Blog.new(blog_params)
    @blog=current_user.blogs.build(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
          flash[:success] = 'Post successfully create'
          redirect_to blogs_path
        else
          render :new
      end
    end
  end
  def edit
  end
  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end
  def update
    if @blog.update(blog_params)
    flash[:success] = 'Post successfully update'
    redirect_to blogs_path
  else
    render :edit
  end
  end
  def destroy
    @blog.destroy
    flash[:success] = 'Post successfully destroy'
    redirect_to blogs_path
  end
  def confirm
    @blog=Blog.new(blog_params)
    @blog = current_user.blogs.build(blog_params)
    render :new if @blog.invalid?
  end
  private
  def blog_params
    params.require(:blog).permit(:content,:image,:image_cache)
  end
  def set_blog
    @blog=Blog.find(params[:id])
  end
end
