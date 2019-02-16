class MoviesController < ApplicationController
  def new
    @movie = Movie.new
    redirect_to root_path unless logged_in?
    flash[:message] = "Sign In to Add a Movie"
  end

  def create
    user = User.find_by(id: session[:user_id])
    @movie = Movie.new(movie_params)
    if @movie.save
      user.movies << @movie
      redirect_to user_path(user)
    else
      render :new
    
    end
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :release_year, :director_name, :starring, :synopsis, :image)
  end
end
