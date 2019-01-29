class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    #byebug
    if @user && @user.authenticate(password: params[:session][:password])

      log_in(@user)
      redirect_to user_path(@user)
    else
      redirect_to signin_path
      flash.now = "Invalid username/password"
    end
  end

  def destroy
    log_out
    redirect_to signin_path
    flash.now = "See you soon!"
  end
end
