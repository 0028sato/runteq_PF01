class Tag < ApplicationRecord
  has_many :post_tag_relations, dependent: :destroy, foreign_key: 'tag_id'
  has_many :posts,through: :post_tag_relations

  validates :name, uniqueness: true, presence: true
end
