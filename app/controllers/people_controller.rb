class PeopleController < ApplicationController
  before_action :require_user
  #before_action :require_same_user
  
  #http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show, :export]
  
  #Index controller to list all people
  def index
    @people = Person.all
    
    
  end
  
  #Export controller to list all people with gifts
  def export
    @people = Person.all
  end
  
  
  #Edit action to edit person
  def edit
    @person = Person.find(params[:id])
    if current_user != @person.user
      flash[:danger] = "You are not authorized to edit this person!"
      session[:user_id] = nil
      redirect_to people_path
    end
  end
  
  #Action to show person page
  def show
    @person = Person.find(params[:id])
  end
  
  #Action for new person
  def new
    @person = Person.new
  end
  
  #Action to create new person
  def create
    @person = Person.new(p_params)
    @person.user = current_user
    @person.save
    if @person.save
      redirect_to @person
    else
      render 'new'
    end
  end
  
  #Action to update new person
  def update
    @person = Person.find(params[:id])
 
    if @person.update(p_params)
    redirect_to @person
    else
      render 'edit'
    end
  end
  
  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    redirect_to people_path
  end
  
  private
  def p_params
    params.require(:person).permit(:name, :user_id)
  end
  def require_same_user
    @person = Person.find(params[:id])
    if current_user != @person.user
    flash[:danger] = "You are not authorized to view this person!"
    session[:user_id] = nil
    redirect_to people_path
    end
  end
  
  

end