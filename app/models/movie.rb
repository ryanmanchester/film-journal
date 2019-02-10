class Movie < ApplicationRecord
  belongs_to :director
  has_many :user_movies
  has_many :users, through: :user_movies

  def director_name=(name)
    self.director = Director.find_or_create_by(name: name)
  end

  def director_name
    self.director ? self.director.name : nil
  end
end
