class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :slug
      t.text :describe
      t.datetime :premiere_at

      t.timestamps
    end
  end
end
