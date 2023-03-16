class BookcrossingsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @user = User.find (current_user.id)

    @book = Book.find(params[:book_id]).decorate
    
    @books = @user.books.map { |book| [book.title, book.id] }
    
    @place = @book.place_id
    
    
    @bookcrossing = Bookcrossing.new
  end

  def create

    # if user_signed_in?
    #   @bookcrossing = current_user.bookcrossings.build bookcrossing_params
    # else
    #   @bookcrossing = Bookcrossing.new bookcrossing_params
    # end
    
    @bookcrossing = Bookcrossing.new bookcrossing_params
    @bookcrossing.user_id = current_user.id
 

   
    if @bookcrossing.save
      flash[:success] = 'book crossing complete'
      redirect_to books_path
    else
      render :new
    end
  end

  def update
    
  end

  def index
    
  end

  private

  def bookcrossing_params
    params.require(:bookcrossing).permit(:type_bookcrossing, :book_id, :place_id)
  end

  def fetch_places
    @places = Place.order(:name).map { |place| [place.place_name, place.id] }
  end

end