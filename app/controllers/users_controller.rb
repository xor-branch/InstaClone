class UsersController < ApplicationController
  before_action :set_user, only:[:show, :edit, :update, :destroy]
  def new
    @user=User.new
  end
  def create
    @user=User.new(user_params)
    if @user.save
      flash[:success]="account created successfull"
      redirect_to new_session_path
    else
      flash[:danger]="something is wrong !"
      render :new
    end
  end
  def show

  end
  def edit

  end
  def update
    if @user.update(user_params)
      flash[:success]="Post update"
      session.delete(:user_id)
      redirect_to new_session_path

    else
      render :new
    end

  end
  def destroy
    @blog=@user.blogs.ids
    @blog.each do|blog|
      Blog.find(blog).destroy
    end
    session.delete(:user_id)
    @user.destroy
    redirect_to blogs_path
  end
  private
  def user_params
    @user=params.require(:user).permit(:name,:email,:image,:image_cache,:password,:password_confirmation,)
  end
  def set_user
    @user=User.find(params[:id])
  end
end
