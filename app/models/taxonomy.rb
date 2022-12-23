class Taxonomy < ApplicationRecord
  belongs_to :post

  validates :name, presence: true
  validates :body, presence: true, length: { maximum: 65_535 }
end
