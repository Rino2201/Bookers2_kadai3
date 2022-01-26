class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :limited_user,only:[:edit,:update]
  #最下部にて

  def new
    @newbook = Book.new
  end

  def create
    @user = User.find(current_user.id)
    @newbook = Book.new(book_params)
    @newbook.user_id = current_user.id
    if @newbook.save
      flash[:notice] = 'You have created book successfully'
      redirect_to book_path(@newbook.id)
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @newbook = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @newbook = Book.new
  end

  def destroy
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    @book.destroy
    redirect_to books_path
    flash[:notice]="You have destroyed book successfully"
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.update(book_params)
      flash[:notice] = 'You have updated book successfully'
      redirect_to book_path(@book)
    else
      render :edit
    end
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end


  def limited_user
    @book = Book.find(params[:id])
    @user = @book.user
    unless @user == current_user
      redirect_to books_path
    end
  end
end
