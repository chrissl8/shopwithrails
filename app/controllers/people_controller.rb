class PeopleController < ApplicationController
  
  http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]
  
  #Index controller to list all people
  def index
    @people = Person.all
  end
  
  #Edit action to edit person
  def edit
    @person = Person.find(params[:id])
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
    params.require(:person).permit(:name)
  end

end
