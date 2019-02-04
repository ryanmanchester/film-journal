class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to user_path(@user)
    else
      render 'new'

    end
  end

  def show
    if logged_in?
      @user = User.find_by(id: params[:id])
  else
    redirect_to root_path
    flash[:message] = "Please Sign In or Sign Up for an Account"
  end
end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
