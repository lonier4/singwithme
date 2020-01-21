class AddVideoToLyrics < ActiveRecord::Migration[5.2]
  def change
    add_column :lyrics, :video_url, :string
  end
end
