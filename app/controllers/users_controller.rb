class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

      if @user.update(users_params)
      flash[:notice] = "successfully"
      redirect_to user_path(@user.id)

      else
      render :edit

      end
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end


private

  def users_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(user_path(current_user)) unless @user == current_user
  end
end
