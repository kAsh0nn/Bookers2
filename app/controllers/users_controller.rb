class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
         @user = User.find(params[:id])
  unless @user.id == current_user.id
         redirect_to user_path(current_user.id)
  end
  end

  def update
     @user = User.find(params[:id])
  if @user.update(user_params)
     flash[:notice] =  "You have updated user successfully."
     redirect_to user_path(@user.id)
  else
     render :edit
  end
  end

  def index
    @users = User.all
    @user = current_user
  end

  def destroy
    user = User.(params[:id])
    user.destroy
    redirect_to  books_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :title, :boby)
  end
end
