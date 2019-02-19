class MoviesController < ApplicationController
  before_action :require_login
  before_action :find_user, only: [:create, :show, :update]
  before_action :find_movie, only: [:show, :edit, :update]

  def new
    @movie = Movie.new
  end

  def create
    byebug
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

  end

  def edit

  end

  def update
byebug
    if params[:movie][:user_movies]
      @movie.user_movies.update(movie_params[:user_movies])
    else
      @movie.update(movie_params)
    end
    redirect_to user_path(@user)

  end

  private
  def movie_params
    params.require(:movie).permit(:title, :release_year, :director_name, :starring, :synopsis, :image, user_movies_attributes: [])
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

  def find_movie
    @movie = Movie.find(params[:id])
  end

end
