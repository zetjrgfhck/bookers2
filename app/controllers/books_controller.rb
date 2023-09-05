class BooksController < ApplicationController
  def new
  @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user= current_user
    @book.save
    redirect_to book_path(@book)
  end

  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
    @book = Book.new
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end