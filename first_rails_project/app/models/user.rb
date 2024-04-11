class User < ApplicationRecord
  validates :username, presence: true

  has_many :artwork,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Artwork

  has_many :artwork_shares,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :ArtworkShares

  has_many :shared_artworks,
    through: :artwork_shares,
    source: :artwork
end
