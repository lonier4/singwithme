class Video < ApplicationRecord
  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader
  
  belongs_to :user

  validates :title, presence: true
  validates :artist, presence: true
  validates :video, presence: true
end
