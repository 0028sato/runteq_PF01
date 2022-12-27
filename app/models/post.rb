class Post < ApplicationRecord
  mount_uploader :post_image, PostImageUploader
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :taxonomies, dependent: :destroy
  has_many :post_tag_relations,dependent: :destroy
  has_many :tags,through: :post_tag_relations

  validates :body, presence: true, length: { maximum: 65_535 }
  validates :budget, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 9999999}

  def liked_by?(user)
    likes.where(user_id: user).exists?
  end

  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end

    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      self.tags << new_post_tag
    end
  end

end
