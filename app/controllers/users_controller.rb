class UsersController < ApplicationController
  before_action :require_admin, except: [:new,:create]
  
  def index
    @users = User.all
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
 
    if @user.update(user_params)
    redirect_to admin_path
    else
      render 'edit'
    end
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path
      else
        render 'new'
      end
  end
  
  private
    
    def user_params
      params.require(:user).permit(:username,:password,:is_active)
    end
    
    def require_admin
      if current_user == nil || current_user.is_active < 2
        flash[:danger] = "You are not authorized to view this page!"
        session[:user_id] = nil
        redirect_to login_path
      end
    end
  
end
