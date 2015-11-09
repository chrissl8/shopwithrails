class GiftsController < ApplicationController
  
  def create
    @person = Person.find(params[:person_id])
    @gift = @person.gifts.create(g_params)
    redirect_to person_path(@person)
  end
  
  def destroy
    @person = Person.find(params[:person_id])
    @gift = @person.gifts.find(params[:id])
    @gift.destroy
    redirect_to person_path(@person)
  end
  
  def set_purchased_true
    @person = Person.find(params[:person_id])
    @gift = @person.gifts.find(params[:id])
    @gift.update_attribute(:purchased, 1)
    redirect_to person_path(@person)
  end
  
  
  
  private
    def g_params
      params.require(:gift).permit(:item, :store, :cost)
    end
  
end
