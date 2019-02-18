module MoviesHelper
  def add_movie(movie)
    #@user = User.find_by(id: session[:user_id])
    @user.movies << movie
  end
end
