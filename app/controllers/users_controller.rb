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

    @user = User.find_by(id: params[:user_id])
    redirect_to root_path unless @user == current_user
    flash[:message] = "Action not permitted"

end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
