class GiftsController < ApplicationController
  before_action :require_same_user
  
  def create
    @person = Person.find(params[:person_id])
    @gift = @person.gifts.create(g_params)
    redirect_to person_path(@person)
  end
  
  def edit
    @gift = Gift.find(params[:id])
  end
  
  def update
    @person = Gift.find(params[:id]).person
    @gift = Gift.find(params[:id])
    if @gift.update(g_params)
    redirect_to person_path(@person)
    else
      render 'edit'
    end
  end
  
  def destroy
    @person = Person.find(params[:person_id])
    @gift = @person.gifts.find(params[:id])
    @gift.destroy
    redirect_to person_path(@person)
  end
  
  def set_purchased_true
    @person = Gift.find(params[:id]).person
    @gift = @person.gifts.find(params[:id])
    @gift.update_attribute(:purchased, 1)
    redirect_to person_path(@person)
  end
  
  def set_purchased_false
    @person = Gift.find(params[:id]).person
    @gift = @person.gifts.find(params[:id])
    @gift.update_attribute(:purchased, 0)
    redirect_to person_path(@person)
  end
  
  private
    def g_params
      params.require(:gift).permit(:item, :store, :cost, :price)
    end
    
    def require_same_user
      @gift = Gift.find(params[:id])
      if current_user != @gift.person.user || current_user.id == nil
        flash[:danger] = "You are not authorized to view this gift!"
        session[:user_id] = nil
        redirect_to login_path
      end
    end
  
end
