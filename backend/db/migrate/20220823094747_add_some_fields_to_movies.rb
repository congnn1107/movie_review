class AddSomeFieldsToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :director, :string, nil: true
    add_column :movies, :actors, :string, nil: true
  end
end
