class CreateUserVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :user_videos do |t|
      t.string :title
      t.string :artist
      t.integer :user_id
      t.timestamps
    end
    add_index :user_videos, :user_id
  end
end
