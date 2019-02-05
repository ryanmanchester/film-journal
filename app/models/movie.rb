class Movie < ApplicationRecord
  belongs_to :director
  has_many :user_movies
  has_many :users, through: :user_movies
end
