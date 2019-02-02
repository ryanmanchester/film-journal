class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    #byebug
    if @user && @user.authenticate(params[:session][:password])

      log_in(@user)
      redirect_to user_path(@user)
    else
      flash[:alert] = "Invalid username/password"
      redirect_to signin_path
    end
  end

  def destroy
    log_out
    flash[:message] = "See you soon!"
    redirect_to signin_path
  end
end
