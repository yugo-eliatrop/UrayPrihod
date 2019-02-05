class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { maximum: 300 }
  validates :content, presence: true
  validates :image, file_size: { less_than: 1.megabytes }
end
