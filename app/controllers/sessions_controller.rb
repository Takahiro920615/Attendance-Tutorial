class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email:params[:session][:email].downcase)
    if user && user.authenticate(params[:sessin][:password])
    log_in user
    redirect_to user
    else
    flash.now[:danger] = "認証に失敗しました。"
    render :new
    end
  end
  
  def current_user.name
    if session[:user_id]
     @current_user ||=  User.find_by(id: session[:user_id])
     
    end
  end
end
