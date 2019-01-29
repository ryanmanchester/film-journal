class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if !params[:user][:username].blank? && !params[:user][:password].blank?
      @user = User.create(user_params)
      redirect_to user_path(@user)
    else
      redirect_to '/signin'
    end
  end

  def show

    @user = User.find_by(id: params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
