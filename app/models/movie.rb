class Movie < ApplicationRecord
  belongs_to :director, optional: true
  has_many :user_movies
  has_many :users, through: :user_movies
  #validates :title, :starring, :director_name, :synopsis, :release_year, :image, presence: true
 accepts_nested_attributes_for :user_movies

  def director_name=(name)
    self.director = Director.find_or_create_by(name: name)
  end

  def director_name
    self.director ? self.director.name : nil
  end

  def user_movies_attributes=(movie_attributes)
    movie_attributes.values.each do |movie_attribute|
      user_movie = UserMovie.find_or_create_by(user_id: movie_attribute[:user_id], movie_id: self.id)
      user_movie.update(movie_attribute)
    end
  end
end
