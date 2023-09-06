class UsersController < ApplicationController
  before_action :authenticate_user!

  def new
    @book = Book.new
  end

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    
  end

private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end