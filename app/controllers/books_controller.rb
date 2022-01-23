class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    # @book = Book.new →投稿したidに飛ぶようにする？
  end

  def destroy
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    @book.destroy
    redirect_to books_path
    flash[:notice]="消しちゃったよよ!!!!!!!!!!!!"
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
