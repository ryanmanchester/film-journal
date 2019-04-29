class SessionsController < ApplicationController

  def new
  end

  def create
    if auth = request.env["omniauth.auth"]
      @user = User.from_omniauth(auth)
      log_in(@user)
      redirect_to user_movies_path(@user)
    else
      @user = User.find_by(username: params[:session][:username])
      if @user && @user.authenticate(params[:session][:password])
        log_in(@user)
        redirect_to user_movies_path(@user)
      else
        redirect_to signin_path
        flash[:alert] = "Invalid username/password"
      end
    end
  end

  def destroy
    log_out
    redirect_to signin_path
    flash[:message] = "See you soon!"
  end
end
