class SnowBoard < ApplicationRecord
  has_many :post_board_relations, dependent: :destroy, foreign_key: 'snow_board_id'
  has_many :posts, through: :post_board_relations
end
