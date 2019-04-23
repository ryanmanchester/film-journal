module MoviesHelper

  def add_movie(movie)
    @user.movies << movie
    @user.movies.update(movie_params)
  end


  def delete_movie(movie)
    movie.user_movies.delete_all
    movie.destroy
  end
end
