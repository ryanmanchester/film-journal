class UserMovie < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  scope :reviewed, -> (written) {where(review: written)}
end
