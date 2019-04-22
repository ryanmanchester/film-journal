class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true
  has_many :user_movies
  has_many :movies, through: :user_movies

  has_secure_password

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.name
      user.password = SecureRandom.hex
    end
  end

end
