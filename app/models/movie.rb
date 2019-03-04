class Movie < ApplicationRecord
  belongs_to :director
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
    
      user_movie = UserMovie.find_or_create_by(movie_attribute)
      self.user_movies << user_movie
    end
  end
end
