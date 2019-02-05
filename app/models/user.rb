class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true
  has_many :user_movies
  has_many :movies, through: :user_movies
  
  has_secure_password
end
