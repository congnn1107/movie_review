class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :post_id
      t.boolean :is_agree
      t.timestamps
    end

    add_index :votes, [:user_id, :post_id], unique: true
  end
end
