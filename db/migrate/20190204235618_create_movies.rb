class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :release_year
      t.string :director
      t.string :starring
      t.string :synopsis
      t.string :image

      t.timestamps
    end
  end
end
