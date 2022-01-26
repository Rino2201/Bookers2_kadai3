class UsersController < ApplicationController

  before_action :authenticate_user!
  # deviseメソッド,非ログイン時ユーザーページにリダイレクト
  before_action :limited_user,only:[:edit,:update]
  #最下部にて

  def index
    @users = User.all

    @user = current_user

    @newbook = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books

    @newbook = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'You have updated user successfully'
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def limited_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

end
