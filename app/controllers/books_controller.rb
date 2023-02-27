class BooksController < ApplicationController

  before_action :set_book!, only: %i[destroy edit show update]
  
  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params
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
    @pagy, @books = pagy(Book.all)
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
    params.require(:book).permit(:title, :author, :condition, :description)
  end

  def set_book!
    @book = Book.find params[:id]
  end
end
