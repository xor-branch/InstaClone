class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(blog_id: params[:blog_id])
    redirect_to blogs_url, notice: "You bookmarked #{favorite.blog.user.name} blog"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to blogs_url, notice: "You unfavorited #{favorite.blog.current_user.name} blog"
  end
  def show
    @favorite = current_user.favorites.all if logged_in?
  end
end
