class SnowShoe < ApplicationRecord
    has_many :post_shoe_relations, dependent: :destroy, foreign_key: 'snow_shoe_id'
    has_many :posts, through: :post_shoe_relations

    validates :shoe_name, presence: true
end
