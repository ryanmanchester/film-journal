class MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def create
    byebug
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :release_year, :director_name, :starring, :synopsis, :image)
  end
end
