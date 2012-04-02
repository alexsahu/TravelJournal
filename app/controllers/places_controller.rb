class PlacesController < ApplicationController
  
  def index
  end
   
  def show
    @place = Place.find(params[:id])
  end
  
  def new
    @place = Place.new
    @place.reviews.build
  end
  
  def create
    
      @place = Place.new(params[:place])
      @place.reviews.build
      if @place.save
        flash[:notice] = "Place Saved"
        redirect_to :action => "show" , :id => @place
      else
        render :new
      end
  end
  
  def edit
  end
  
  def update
  end
end
