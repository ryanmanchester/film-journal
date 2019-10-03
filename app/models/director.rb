class Director < ApplicationRecord
  has_many :movies

  scope :popular_director, -> { self.joins(:movies).group(:id).order("count(movies.id) desc").limit(1)}

  # def sort_directors_name(directors)
  #   directors.sort_by {|director| director.name}
  # end
end
