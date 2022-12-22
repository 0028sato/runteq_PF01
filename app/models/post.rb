class Post < ApplicationRecord
  mount_uploader :post_image, PostImageUploader
  belongs_to :user

  validates :body, presence: true, length: { maximum: 65_535 }
  validates :budget, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 9999999}
end
