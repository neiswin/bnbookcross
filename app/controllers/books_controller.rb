class BooksController < ApplicationController
  
  before_action :set_book!, only: %i[destroy edit show update]
  before_action :fetch_places, only: %i[create edit new index]
  # before_action :authenticate_user!, except: %i[index show]
  before_action :authorize_book!
  after_action :verify_authorized
  # skip_after_action :verify_authorized, only: %i[donate]


  def new
    @book = Book.new
  end

  def create
    
    if user_signed_in?
      @book = current_user.books.build book_params
    else
      @book = Book.new book_params
    end

    if @book.save
      flash[:success] = 'Book added!'
      redirect_to books_path
    else
      render :new
    end
  end

  def update
    if @book.update book_params
      flash[:success] = 'Book update!'
      redirect_to books_path
    else
      render :edit
    end
  end
  
  def index
    @pagy, @books = pagy Book.order(created_at: :desc) 
    @books = @books.decorate
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true).order(created_at: :desc) 
    # debugger
    @books = @books.decorate
  end

  def show
  end

  def edit
  end


  def destroy
    @book.destroy
    flash[:success] = 'Book deleted!'
    redirect_to books_path
  end


  private

  def book_params
    params.require(:book).permit(:title, :author, :condition_book, :description, :status_book, :place_id)
  end

  def set_book!
    @book = Book.find params[:id]
  end

  def fetch_places
    @places = Place.order(:name).map { |place| [place.place_name, place.id] }
  end

  def authorize_book!
    authorize(@book || Book)
  end

end
