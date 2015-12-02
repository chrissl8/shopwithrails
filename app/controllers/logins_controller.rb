class LoginsController < ApplicationController
  
  def new
    
  end
  
  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password]) && user.is_active == 0  
      flash[:danger] = "User has not been activated, contact Administrator!"
      render 'new'
    elsif user && user.authenticate(params[:password]) && user.is_active > 0
      session[:user_id] = user.id
      redirect_to people_path
    else
      flash[:danger] = "Invalid username or password!"
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
  
end
