class AddRatingsToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :ratings, :string
  end
end
