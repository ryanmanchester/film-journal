class RemoveMovieFromDirectors < ActiveRecord::Migration[5.2]
  def change
    remove_column :directors, :movie, :string
  end
end
