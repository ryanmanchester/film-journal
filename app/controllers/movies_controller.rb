class MoviesController < ApplicationController
  before_action :require_login
  before_action :all_directors, only: [:new, :edit]
  before_action :find_user
  before_action :find_movie, only: [:show, :edit, :update, :destroy]

  def new
    @movie = Movie.new
    @movie.user_movies.build
  end

  def create
    if params[:movie][:id][1]
      movie = Movie.find(params[:movie][:id][1])
      @user.movies << movie
      redirect_to user_path(@user)
    else
      movie = Movie.create(movie_params)
      @user.movies << movie

      redirect_to user_path(@user)
     end
  end


  def show

  end

  def edit

  end

  def update
    
   @movie.update(movie_params)
   redirect_to user_path(@user)
  end

  def destroy
    @movie.destroy
    redirect_to user_path(@user)
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :release_year, :director_name, :starring, :synopsis, :image, user_movies_attributes: [:review, :rating, :user_id])
  end


  def require_login
    unless logged_in?
    flash[:message] = "Please Sign In"
    redirect_to signin_path
  end
end

  def find_user
    @user = User.find_by(id: session[:user_id])
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def all_directors
    @directors = Director.all
  end

end
