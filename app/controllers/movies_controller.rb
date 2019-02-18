class MoviesController < ApplicationController
  before_action :require_login
  before_action :find_user, only: [:create, :show]

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    #byebug
    if @movie.save
      add_movie(@movie)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :release_year, :director_name, :starring, :synopsis, :image)
  end

  def require_login
    unless logged_in?
    flash[:message] = "Sign In to Add a Movie"
    redirect_to signin_path
  end
end

  def find_user
    @user = User.find_by(id: session[:user_id])
  end

end
