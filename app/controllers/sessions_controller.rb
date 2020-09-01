class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash.now[:success] = 'well done!'
      redirect_to user_path(user.id)
    else
      redirect_to new_session_path
      flash[:danger] = 'ooh ! something is wrong'
    end
  end
  def destroy
    session.delete(:user_id)
    flash[:success] = 'good bye'
    redirect_to blogs_path
  end
end
