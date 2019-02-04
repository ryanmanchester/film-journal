class User < ApplicationRecord
  validates :username, uniqueness: true
  validates :password, presence: true
  has_secure_password
end
