class SnowBinding < ApplicationRecord
    has_many :post_binding_relations, dependent: :destroy, foreign_key: 'snow_binding_id'
    has_many :posts, through: :post_binding_relations

    validates :binding_name, presence: true
end
