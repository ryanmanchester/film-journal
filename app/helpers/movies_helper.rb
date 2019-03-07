module MoviesHelper
  def update_user_movie
    user_movie = UserMovie.find_by(user_id:  params[:movie][:user_movies_attributes]["0"][:user_id], movie_id: params[:id])
    user_movie.update(movie_params[:user_movies_attributes]["0"])
  end
end
