module MoviesHelper

  def add_movie(movie)
    movie.update(movie_params)
    @user.movies << movie
  end


  def delete_movie(movie)
    movie.user_movies.delete_all
    movie.destroy
  end
end
