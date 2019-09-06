class MoviesController < ApplicationController
  before_action :require_login
  before_action :find_user
  before_action :all_directors, only: [:new, :create, :edit, :index, :popular_director]
  before_action :find_movie, only: [:show, :edit, :update, :destroy]

  def new
    @movie = Movie.new
    @movie.user_movies.build
  end

  def create
    @movie = Movie.find_or_initialize_by(title: movie_params[:title])
    if @movie.update(movie_params)
      redirect_to user_movies_path
    elsif @movie.save
      redirect_to user_movies_path
    else
      render :new
    end
  end

  def index
    case params[:sorting_options]
    when "Rating"
      @movies = @user.movies.order_rating
    when "5 Stars Only"
      @movies = @user.movies.highest_rated
    when "Oldest"
      @movies = @user.movies.oldest
    else
      @movies = @user.movies.newest
    end
  end

  def popular_director
    @director = @directors.popular_director
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
    @movie.user_movies.destroy_all
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
    @directors = Director.all.sort_by(&:name)
  end

end
