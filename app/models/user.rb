class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post
  has_many :my_posts, dependent: :destroy
  has_many :my_post_relations, through: :my_posts, source: :post
  has_many :authentications, dependent: :destroy

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true, length: { maximum: 255 }
  validates :reset_password_token, presence: true, uniqueness: true, allow_nil: true

  mount_uploader :avatar, AvatarUploader

  enum gender: { lgbt:0, man:1, woman:2 }
  enum age: { no_age:0, ten:1, twenty:2, thirty:3, forty:4, fifty:5, sixty:6, seventy:7, eighty:8 }

  accepts_nested_attributes_for :authentications

  def own?(object)
    id == object.user_id
  end

  def like(post)
    like_posts << post
  end

  def unlike(post)
    like_posts.destroy(post)
  end

  def like?(post)
    like_posts.include?(post)
  end
end
