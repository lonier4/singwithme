class Video < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :artist, presence: true
end
