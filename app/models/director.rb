class Director < ApplicationRecord
  has_many :movies

  def sort_directors_name(directors)
    directors.sort_by {|director| director.name}
  end
end
