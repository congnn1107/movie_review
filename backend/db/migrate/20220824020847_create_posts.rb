class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, nil: false
      t.string :slug, nil: false
      t.text :content
      t.integer :user_id
      t.integer :movie_id
      t.boolean :is_publish, default: false
      t.datetime :published_at

      t.timestamps
    end

    add_index :posts, :title, type: :fulltext
    add_index :posts, :slug, unique: true

  end
end
