class PlacesController < ApplicationController
  def index
    @places = Place.all
  end
  
  def show
    @place = Place.find params[:id]
    @books = @place.books
  end
end