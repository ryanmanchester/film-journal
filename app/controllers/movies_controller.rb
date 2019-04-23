class MoviesController < ApplicationController
  before_action :require_login
  before_action :all_directors, only: [:new, :edit, :index]
  before_action :find_user
  before_action :find_movie, only: [:show, :edit, :update, :destroy]

  def new
    @movie = Movie.new
    @movie.user_movies.build
  end

  def create
    if movie = Movie.find_by(title: movie_params[:title])
      add_movie(movie)
      redirect_to user_movies_path
    else
      @user.movies.create(movie_params)
      redirect_to user_movies_path
     end
  end

  def index
    if params[:director_id]
      @movies = @user.movies.directors(params[:director_id])
    else
      @movies = @user.movies
    end
  end


  def show

  end

  def edit

  end

  def update
    @movie.update(movie_params)
    redirect_to user_movies_path
    flash[:message] = "Movie Successfully Updated"
  end

  def destroy
    delete_movie(@movie)
    redirect_to user_movies_path
    flash[:message] = "Movie Successfully Deleted"
  end


  private
  def movie_params
    params.require(:movie).permit(:title, :release_year, :director_name, :starring, :synopsis, :image, user_movies_attributes: [:review, :rating, :user_id])
  end


  def require_login
    unless logged_in?
      redirect_to signin_path
      flash[:alert] = "Please Sign In"
    end
  end

  def find_user
    @user = User.find_by(id: params[:user_id])
    unless current_user == @user
      log_out
      redirect_to signin_path
      flash[:alert] = "Action Not Permitted"
    end
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def all_directors
    @directors = Director.all
  end

end
