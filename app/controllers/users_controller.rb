class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to user_path(@user), message: "Welcome back, #{@user.username}!"
    else
      redirect_to signup_path
    end
  end

  def show
    if logged_in?
      @user = User.find_by(id: params[:id])
  else
    redirect_to root_path, message: "Please Sign In or Sign Up for an Account"
  end
end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
