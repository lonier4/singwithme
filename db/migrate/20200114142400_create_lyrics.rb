class CreateLyrics < ActiveRecord::Migration[5.2]
  def change
    create_table :lyrics do |t|
      t.string :title
      t.string :artist
      t.text :video_url
      t.integer :user_id
      t.timestamps
    end
    add_index :lyrics, :user_id
  end
end
