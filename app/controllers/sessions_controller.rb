class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    #byebug
    if @user && @user.authenticate(params[:session][:password])
      log_in(@user)
      redirect_to user_path(@user)
      flash[:success] = "Welcome back, #{@user.username}!"
    else
      redirect_to signin_path
      flash[:alert] = "Invalid username/password"
    end
  end

  def destroy
    log_out
    redirect_to root_path
    flash[:message] = "See you soon!"

  end
end
