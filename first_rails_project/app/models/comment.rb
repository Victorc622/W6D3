class Comment < ApplicationRecord
  validates :author_id, :artwork_id, :body, presence: true

  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User

  belongs_to :artwork,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Artwork

  has_many :likes,
    as: :likeable
end
